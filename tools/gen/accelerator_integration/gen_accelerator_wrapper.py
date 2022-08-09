import json
import argparse
from aig_gen import *
from validate_config import get_reg_width, validate_config


def define_signal(name: str, direction: str, stype: str, size: int, isize: int = 4,
                  ichar: str = ' ') -> str:
    """Define a chisel3 signal definition.

    Parameters
    ----------
    name : str
        Signal name.
    direction : str
        `Input` or `Output`.
    stype : str
        Signal type (UInt, Bool).
    size : int
        Signal's width.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Chisel3 signal definition.
    """
    def size_to_str(size: int) -> str:
        return str(size) + '.W' if size > 1 else ''
    return def_value(name, f"{direction}({stype}({size_to_str(size)}))", False, isize, ichar)


def switch_direction(direction: str) -> str:
    """Switch from Input to Output or Output to Input.

    Parameters
    ----------
    direction : str
        `Input` or `Output`

    Returns
    -------
    str
        Input` or `Output`.
    """
    return 'Input' if direction == 'Output' else 'Output'


def gen_wrapper(config_path: str, wrapper_path: str) -> None:
    """Generate Accelerator BlackBox module that provides the layer
    between the Verilog Accelerator source file and chisel3.

    Parameters
    ----------
    config_path : str
        Path to a valid AIG configuration.
    wrapper_path : str
        Path to the output file.
    """
    os.makedirs(os.path.dirname(wrapper_path), exist_ok=True)
    with open(config_path, 'r') as conf, open(wrapper_path, 'w') as fout:
        config = json.load(conf)
        acc = config["accelerator"]
        data_width = get_reg_width(config)

        _axi_stream_signal = {
            "tvalid": ("Input", "Bool", 1),
            "tready": ("Output", "Bool", 1),
            "tuser": ("Input", "Bool", 1),
            "tlast": ("Input", "Bool", 1),
            "tdata": ("Input", "UInt", data_width)
        }

        source_file = acc["sourceFile"]
        signals = acc["signals"]
        ins = signals["input"]
        outs = signals["output"]

        # Define Accelerator package and imports
        out = def_package("AIG.AcceleratorIntegration")
        out += def_imports(["chisel3._", "chisel3.util.HasBlackBoxResource"])

        # Rename module to match the name of given Accelerator
        top_module_name = f'"{acc["topName"]}"'
        override_name = def_value("desiredName", top_module_name, True, 2)

        # Define clock and reset
        clock_name = signals["clock"]
        reset_name = signals["reset"]
        signal_defs = define_signal(clock_name, "Input", "Clock", 1) + '\n'
        signal_defs += define_signal(reset_name, "Input", "Reset", 1) + BR

        # Define AXI Stream input signals
        signal_defs += "\n".join([define_signal(acc_s, *(_axi_stream_signal[axis_s]))
                                 for (axis_s, acc_s) in ins.items()]) + BR

        # Define AXI Stream output signals
        out_signals = []
        for axis_name, acc_name in outs.items():
            direction, wire_type, size = _axi_stream_signal[axis_name]
            out_signals.append(define_signal(
                acc_name, switch_direction(direction), wire_type, size))
        signal_defs += "\n".join(out_signals)

        # Define custom CSR signals
        csrs = acc["csr"]
        for csr in csrs:
            signals = [define_signal(field["name"], field["direction"],
                                     field["type"], field["size"]) for field in csr["fields"]]
            signal_defs += BR + "\n".join(signals)
        io = def_io(signal_defs)
        add_resource = f'{indent(2)}addResource("{f"{source_file}"}")'
        class_content = "\n".join([override_name, io, add_resource])
        out += def_class("Accelerator", [],
                         "BlackBox with HasBlackBoxResource", class_content)
        fout.write(out)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="AIG Accelerator Generator")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    parser.add_argument("--out-path", default=DEF_WRAPPER_PATH,
                        type=str, help="Output Accelerator Wrapper file path")

    args = parser.parse_args()
    validate_config(args.config_path)
    gen_wrapper(args.config_path, args.out_path)
