import json
import argparse
from aig_gen import *
from validate_config import validate_config


def get_io(isize: int = 2, ichar: str = ' ') -> str:
    """Get chisel3 io field definition.

    Calls the def_io function with AcceleratorIntegration-specific IO fields.

    Parameters
    ----------
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        AcceleratorIntegration IO field definition.
    """
    fields = {"clk": "Input(Clock())",
              "rst": "Input(Reset())",
              "in": "Flipped(new AXIStream(dataWidth))",
              "out": "new AXIStream(dataWidth)",
              "csrs": "new CustomCSRBundle"}
    fields_str = "\n".join([def_value(l, r, isize=isize + 2)
                           for l, r in fields.items()])
    return def_io(fields_str, isize, ichar)


def connect(x: str, y: str, isize: int = 2, ichar: str = ' ') -> str:
    """Define signal bulk connection.

    Parameters
    ----------
    x : str
        Left side of the connection.
    y : str
        Right side of the connection.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Formatted connection between x and y.
    """
    return f"{ichar * isize}{x} <> {y}"


def connect_axis(axis: dict[str, str], is_input: bool = False) -> str:
    """Connect AXI Streams with given mapping.

    Parameters
    ----------
    axis : dict
        Connections between AIGs AXI Stream signal names and the signal names
        from the Accelerator.
    is_input : bool, default=False
        True when the AXI Stream that is being connected is on the Accelerator's input.

    Returns
    -------
    str
        Formatted signal connections between Accelerator and AXI Stream.
    """
    def order(x: str, y: str) -> tuple[str, str]:
        return (x, y) if is_input else (y, x)

    def fmt(acc_sig: str, axis_sig: str) -> str:
        x, y = order(
            f"accelerator.io.{acc_sig}", f"io.{'in' if is_input else 'out'}.{axis_sig}")
        return connect(x, y)

    return "\n".join([fmt(acc_sig, axis_sig) for axis_sig, acc_sig in axis.items()])


def connect_input_axis(axis: dict[str, str]) -> str:
    """Connect the AXI Stream that is on Accelerator's input.

    Parameters
    ----------
    axis : dict
        Dictionary of AIG AXI Stream signal names to Accelerator signals' names.

    Returns
    -------
    str
        Formatted signal connections from AXI Stream (input) to Accelerator.
    """
    return connect_axis(axis, True)


def connect_output_axis(axis: dict[str, str]) -> str:
    """Connect the AXI Stream that is on Accelerator's output.

    Parameters
    ----------
    axis : dict
        Dictionary of AIG AXI Stream signal names to Accelerator signals' names.

    Returns
    -------
    str
        Formatted signal connections from Accelerator to AXI Stream (output).
    """
    return connect_axis(axis)


def connect_csrs(csrs: dict[dict, str]) -> str:
    """Connect the CSR custom bundle definition to appropriate Accelerator signals.

    Parameters
    ----------
    csrs : dict
        "csr" field from the configuration file.

    Returns
    -------
    str
        Formatted CSR signals connections.
    """
    csr_signals = []
    for csr in csrs:
        for field in csr["fields"]:
            x = f"""io.csrs.{csr["name"].lower()}.{field["name"]}"""
            y = f"""accelerator.io.{field["name"]}"""
            if field["direction"] == "Output":
                x, y = y, x
            csr_signals.append(connect(x, y))

    return "\n".join(csr_signals)


def init_acc(signals: dict, isize: int = 2, ichar: str = ' ') -> str:
    """Initialize the Accelerator in the AcceleratorIntegration and connect the basic signals.

    Parameters
    ----------
    signals : dict
        "signals" in "Accelerator" field from the configuration file.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Initialized Accelerator with clock and reset signals connected.
    """
    acc_prefix = "accelerator.io"
    acc = def_value("accelerator", "Module(new Accelerator)",
                    False, isize, ichar)
    clk = connect("io.clk", f'{acc_prefix}.{signals["clock"]}', isize, ichar)
    rst = connect("io.rst", f'{acc_prefix}.{signals["reset"]}', isize, ichar)
    return "\n".join([acc, clk, rst])


def gen_integration(config_path: str, integration_path: str) -> None:
    """Generate AcceleratorIntegration file that connects the
    Accelerator Wrapper to the rest of the system.

    Parameters
    ----------
    config_path : str
        Path to a valid AIG configuration.
    integration_path : str
        Path to the output file.
    """
    with open(config_path, 'r') as conf, open(integration_path, 'w') as fout:
        config = json.load(conf)
        acc = config["accelerator"]
        signals = acc["signals"]

        imports = ["chisel3._", "chisel3.util.HasBlackBoxInline", "DMAController._",
                   "DMAController.Frontend._", "DMAController.Bus.AXIStream", "AIG.CSR._",
                   "AIG.AIGConfig.AIGConfigUtils", "AIG.CSR.CustomCSRDefinition._"]

        head = def_package("AIG.AcceleratorIntegration") + def_imports(imports)
        content = BR.join([get_io(), init_acc(signals), connect_input_axis(
            signals["input"]), connect_output_axis(signals["output"]), connect_csrs(acc["csr"])])

        fout.write(head + def_class("AcceleratorIntegration",
                   ["dataWidth: Int"], "Module", content))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="AIG Register Definition Generator")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    parser.add_argument("--out-path", default=DEF_INTEGRATION_PATH,
                        type=str, help="Output Accelerator Wrapper file path")

    args = parser.parse_args()
    validate_config(args.config_path)
    gen_integration(args.config_path, args.out_path)
