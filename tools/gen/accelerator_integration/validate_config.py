import json
import argparse
import os

from jsonschema import validate
from aig_gen import DEF_CONFIG_PATH

_reg_type_dict = {
    "storage": "StorageRegister",
    "status": "StatusRegister",
    "clear": "ClearRegister",
}
_valid_chisel_types = ["Bool", "UInt", "SInt"]
_valid_directions = ["Input", "Output"]
_valid_data_buses = ["AXI", "WB", "PWB"]
_valid_csr_buses = ["AXIL", "WB"]


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
    return config['accelerator']['params']["controlDataWidth"]


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
        if total_reg_size > data_width:
            raise ValueError(
                f"Total {reg_name} register size: {total_reg_size} exceeds data width: {data_width}")

        for field in reg_fields:
            field_type = field["type"]
            field_name = field["name"]
            field_dir = field["direction"]

            if field_type not in _valid_chisel_types:
                raise ValueError(
                    f"Invalid data type {field_type} in {reg_name} in {field_name}. Must be one of: {_valid_chisel_types}.")

            if field_dir not in _valid_directions:
                raise ValueError(
                    f"Invalid signal direction: {field_dir}. Must be one of: {_valid_directions}")


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

    from aig_gen import ROOT_DIR
    with open(config_path, 'r') as conf, open(os.path.join(ROOT_DIR, 'docs/aig.schema.json'), 'r') as s:
        config = json.load(conf)
        schema = json.load(s)

        try:
            validate(config, schema)
        except Exception as err:
            raise Exception(f'Invalid config: {type(err)}: {err}')

        bus_config = config["busConfiguration"]

        if not is_bus_config_valid(bus_config):
            raise ValueError(f"Invalid bus configuration: {bus_config}")

        if not any(["dmaIn" in config, "dmaOut" in config, "params" in config["accelerator"]]):
            raise ValueError("Either DMAIn and DMAOut or Accelerator params must be specified")

        validate_accelerator_config(config["accelerator"], int(get_reg_width(config)))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Validate AIG config")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    validate_config(parser.parse_args().config_path)
