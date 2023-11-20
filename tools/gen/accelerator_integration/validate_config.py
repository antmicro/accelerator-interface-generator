import json
import argparse
from aig_gen import DEF_CONFIG_PATH

_valid_params_fields = ["addrWidth", "dataWidth", "maxBurst",
                        "controlAddrWidth", "controlDataWidth", "fifoDepth"]

_valid_chisel_types = ["Bool", "UInt", "SInt"]

_reg_type_dict = {
    "storage": "StorageRegister",
    "status": "StatusRegister",
    "clear": "ClearRegister",
}

_valid_signal_fields = ["clock", "reset", "input", "output"]

_required_dma_fields = []
_allowed_dma_fields = _required_dma_fields + ["params"]

_required_acc_fields = ["sourceFile", "topName", "signals"]
_allowed_acc_fields = _required_acc_fields + ["params", "csr"]

_required_config_fields = ["busConfiguration", "accelerator"]
_allowed_config_fields = _required_config_fields + \
    ["dmaIn", "dmaOut"]

_axi_stream_signals = ["tvalid", "tready", "tuser", "tlast", "tdata"]

_valid_directions = ["Input", "Output"]

_valid_data_buses = ["AXI", "WB", "PWB"]
_valid_csr_buses = ["AXIL", "WB"]


def get_aig_params(config: dict) -> dict:
    assert ("params" in config["accelerator"])
    return config["accelerator"]["params"]


def get_reg_width(config: dict) -> str:
    """Reads the control data width from the configuration.

    Parameters
    ----------
    config : dict
        Parsed json configuration.

    Returns
    -------
    str
        Control data width as string.
    """
    return get_aig_params(config)["controlDataWidth"]


def validate_structure(fields: dict[str, dict], required: list[str], allowed: list[str], name: str) -> None:
    """Validates the fields of given structure.

    Parameters
    ----------
    fields : dict
        Fields of structure to validate.
    required : list[str]
        Fields that are required of given structure.
    allowed : list[str]
        Fields that are allowed for given structure.
    name : str
        Strucure name. Used when raising errors.

    Raises
    ------
    ValueError
        If the property contains invalid field or value.
    """
    for field in required:
        if field not in fields:
            raise ValueError(f"Missing field {field} in {name}")

    for field in fields:
        if field not in allowed:
            raise ValueError(f"Unknown field {field} in {name}")


def validate_csrs(csrs: dict, data_width: int) -> None:
    """Validates the custom Accelerator CSRs.

    Parameters
    ----------
    csrs : dict
        `csr` property from configuration file.
    data_width : int
        Width of the control data. Specified by `controlDataWidth` property.

    Raises
    ------
    ValueError
        If the property contains invalid field or value.
    """
    for csr in csrs:
        reg_type, reg_fields, reg_name = csr["type"], csr["fields"], csr["name"]

        if reg_type not in _reg_type_dict.keys():
            raise ValueError(
                f"Invalid type for register {reg_type}. Must be one of {_reg_type_dict.keys()}")

        total_reg_size = sum([f["size"] for f in reg_fields])
        if total_reg_size >= data_width:
            raise ValueError(
                f"Total {reg_name} register size: {total_reg_size} exceeds data width: {data_width}")

        for field in reg_fields:
            field_type = field["type"]
            field_name = field["name"]
            field_size = int(field["size"])
            field_dir = field["direction"]

            if field_type not in _valid_chisel_types:
                raise ValueError(
                    f"Invalid data type {field_type} in {reg_name} in {field_name}. Must be one of: {_valid_chisel_types}.")

            if field_size < 1:
                raise ValueError(
                    f"Invalid size {field_size} for field {field_name}")

            if field_dir not in _valid_directions:
                raise ValueError(
                    f"Invalid signal direction: {field_dir}. Must be one of: {_valid_directions}")


def validate_dma_config(dma_config: dict[str, dict], name: str) -> None:
    """Validates the properties of the `DMA*` field.

    Parameters
    ----------
    dma_config : dict
        DMA description from json configuration file.
    name : str
        `DMAIn` or `DMAOut`.

    Raises
    ------
    ValueError
        If the property contains invalid field or value.
    """
    validate_structure(dma_config, _required_dma_fields,
                       _allowed_dma_fields, name)
    if "params" in dma_config:
        validate_structure(
            dma_config["params"], _valid_params_fields, _valid_params_fields, name)


def validate_accelerator_config(acc_config: dict[str, dict], reg_width: int) -> None:
    """Validates the properties of the field 'Accelerator' in the config file.

    Parameters
    ----------
    acc_config : dict
        Accelerator description from json configuration file.
    reg_width : int
        Width of the control data. Specified by `controlDataWidth` property.

    Raises
    ------
    ValueError
        If the property contains invalid field or value.
    """
    validate_structure(acc_config, _required_acc_fields,
                       _allowed_acc_fields, "Accelerator")

    validate_structure(acc_config["signals"], _valid_signal_fields,
                       _valid_signal_fields, "Accelerator signals")

    validate_structure(acc_config["signals"]["input"], _axi_stream_signals,
                       _axi_stream_signals, "Accelerator AXI Stream input signals")

    validate_structure(acc_config["signals"]["output"], _axi_stream_signals,
                       _axi_stream_signals, "Accelerator AXI Stream output signals")

    if "params" in acc_config:
        validate_structure(
            acc_config["params"], _valid_params_fields, _valid_params_fields, "Accelerator params")

    if "csr" in acc_config:
        validate_csrs(acc_config["csr"], int(reg_width))


def is_bus_config_valid(bus_config: str) -> bool:
    """Checks if given bus configuration is allowed.

    Parameters
    ----------
    bus_config : str
        Bus configuration in the string form of `{in_bus}_{csr_bus}_{out_bus}`.

    Returns
    -------
    bool
        Validity of given bus configuration.
    """
    in_bus, csr_bus, out_bus = bus_config.split("_")
    return all([in_bus in _valid_data_buses, out_bus in _valid_data_buses, csr_bus in _valid_csr_buses])


def validate_config(config_path: str) -> None:
    """Validates the AIG configuration file.

    Parameters
    ----------
    config_path : str
        Path to configuration json file.

    Raises
    ------
    ValueError
        If any of the properties contains invalid field or value.
    """
    with open(config_path, 'r') as conf:
        config = json.load(conf)

        validate_structure(config, _required_config_fields,
                           _allowed_config_fields, "config")
        bus_config = config["busConfiguration"]

        if not is_bus_config_valid(bus_config):
            raise ValueError(f"Invalid bus configuration: {bus_config}")

        # Optional - if not specified the parameters from 'Accelerator' are applied
        if "DMAIn" in config:
            validate_dma_config(config["DMAIn"], "DMAIn")

        # Optional - if not specified the parameters from 'Accelerator' are applied
        if "DMAOut" in config:
            validate_dma_config(config["DMAOut"], "DMAOut")

        if not any(["dmaIn" in config, "dmaOut" in config, "params" in config["accelerator"]]):
            raise ValueError(
                "Either DMAIn and DMAOut or Accelerator params must be specified")

        validate_accelerator_config(
            config["accelerator"], int(get_reg_width(config)))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Validate AIG config")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    validate_config(parser.parse_args().config_path)
