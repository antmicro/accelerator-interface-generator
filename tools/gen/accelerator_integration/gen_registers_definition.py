import json
import argparse
from aig_gen import *
from validate_config import validate_config


def def_csr_entries(fields: dict) -> str:
    """Define the signals definitions for the custom CSR definition.

    Parameters
    ----------
    fields : dict
        Fields of generated CSR definition.

    Returns
    -------
    str
        Definitions for all signals in `fields` CSR.
    """
    entries = []
    for field in fields:
        field_type = field["type"]
        field_size = field["size"]
        field_dir = field["direction"]
        field_size = str(field_size) + ".W" if field_size > 1 else ""
        entries.append(
            def_value(field["name"], f"{field_dir}({field_type}({field_size}))", isize=2))
    return "\n".join(entries)


def gen_reg_def(config_path: str, reg_def_path: str) -> None:
    """Generate RegisterDefinition file containing all custom CSRs from the json config file.

    Parameters
    ----------
    config_path : str
        Path to a valid AIG configuration.
    reg_def_path : str
        Path to the output file.
    """
    with open(config_path, 'r') as conf, open(reg_def_path, 'w') as fout:
        config = json.load(conf)

        out = def_package("AIG.CSR.CustomCSRDefinition")
        out += def_imports(["chisel3._"])
        out += def_class("RegisterBase", [], "Bundle", "", "abstract") + "\n"

        csrs, ordered_csrs = [], []
        if 'csr' in config['accelerator']:
            csrs = config["accelerator"]["csr"]
            ordered_csrs = sorted(csrs, key=lambda x: x["address"])

        csr_bundle_entries = []
        for csr in ordered_csrs:
            csr_name = csr["name"]
            fields = def_csr_entries(sorted(csr["fields"], key=lambda x: x['offset'], reverse=True))
            out += def_class(csr_name, [], "RegisterBase", fields) + "\n"
            csr_bundle_entries.append(
                def_value(f"{csr_name.lower()}: {csr_name}", f"new {csr_name}"))

        custom_csr_bundle = def_class("CustomCSRBundle", list(
            reversed(csr_bundle_entries)), "Bundle", "", "case")
        out += custom_csr_bundle
        fout.write(out)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="AIG Register Definition Generator")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    parser.add_argument("--out-path", default=DEF_REG_DEF_PATH,
                        type=str, help="Output Register Definition file path")

    args = parser.parse_args()
    validate_config(args.config_path)
    gen_reg_def(args.config_path, args.out_path)
