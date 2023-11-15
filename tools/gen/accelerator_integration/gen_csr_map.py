import json
import argparse
from validate_config import get_reg_width, validate_config, _reg_type_dict
from aig_gen import *


def create_map_entry(address: str, name: str, type: str, width: str, isize: int = 4,
                     ichar: str = ' ') -> str:
    """Define a single CSR map entry.

    Parameters
    ----------
    address : str
        Address of the CSR.
    name : str
        CSR name.
    type : str
        Type of the CSR.
    width : str
        Size of the CSR.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        CSR map entry.
    """
    return f'{indent(isize, ichar)}"h{address[2:]}" -> Module(new {type}[{name}](new {name}, {width}))'


def gen_csr_map(config_path: str, csr_map_path: str) -> None:
    """Generate CSRMap file containing the address space of the Accelerators' CSRs.

    Parameters
    ----------
    config_path : str
        Path to a valid AIG configuration.
    csr_map_path : str
        Path to the output file.
    """
    with open(config_path, 'r') as conf, open(csr_map_path, 'w') as fout:
        config = json.load(conf)

        reg_width = get_reg_width(config)

        out = def_package("AIG.CSR.CustomCSRDefinition")
        out += def_imports(["chisel3._", "AIG.CSR.{BaseRegister, StorageRegister}"])

        if 'csr' not in config['accelerator']:
            reg_map = def_value("regMap", f"Map[String, BaseRegister]()", isize=2)
            csr_map_obj = def_object("CSRMap", content=reg_map)
            fout.write(out + csr_map_obj)
            return

        csrs = config["accelerator"]["csr"]

        map_entries = [create_map_entry(
            csr["address"], csr["name"], _reg_type_dict[csr["type"]], reg_width) for csr in csrs]
        map_entries_str = ',\n'.join(map_entries)

        reg_map = def_value(
            "regMap", f"Map[String, BaseRegister](\n{map_entries_str}\n  )", isize=2)
        csr_map_obj = def_object("CSRMap", content=reg_map)

        fout.write(out + csr_map_obj)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="AIG Register Definition Generator")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    parser.add_argument("--out-path", default=DEF_CSR_MAP_PATH,
                        type=str, help="Output Register Definition file path")
    args = parser.parse_args()
    validate_config(args.config_path)
    gen_csr_map(args.config_path, args.out_path)
