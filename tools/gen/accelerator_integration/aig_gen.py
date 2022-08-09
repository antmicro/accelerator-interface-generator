import argparse
import os

ROOT_DIR = os.path.join(os.path.dirname(
    os.path.abspath(__file__)), '../../../')

DEF_CONFIG_PATH = os.path.join(ROOT_DIR, 'config.json')

DEF_INTEGRATION_PATH = os.path.join(
    ROOT_DIR, 'src/main/scala/AcceleratorIntegration/AcceleratorIntegration.scala')

DEF_WRAPPER_PATH = os.path.join(
    ROOT_DIR, 'src/main/scala/AcceleratorIntegration/Accelerator.scala')

DEF_CSR_MAP_PATH = os.path.join(
    ROOT_DIR, 'src/main/scala/CSR/CustomCSRDefinition/CSRMap.scala')

DEF_REG_DEF_PATH = os.path.join(
    ROOT_DIR, 'src/main/scala/CSR/CustomCSRDefinition/RegistersDefinition.scala')

BR = "\n\n"


def indent(isize: int = 0, ichar: str = ' ') -> str:
    """Get indent.

    Parameters
    ----------
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Indent of specified size and character.
    """
    return f"{isize * ichar}"


def def_package(package_name: str, isize: int = 0, ichar: str = ' ') -> str:
    """Get scala package definition.

    Parameters
    ----------
    package_name : str
        Name of the package the currently processed file belongs to.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Scala package definition to be included at the begining of the file.
    """
    return f"{indent(isize, ichar)}package {package_name}{BR}"


def def_imports(imports: list[str], isize: int = 0, ichar: str = ' ') -> str:
    """Get scala imports.

    Parameters
    ----------
    imports : list[str]
        List of imports to be included.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Scala imports.
    """
    def format_import(pkg: str) -> str:
        return f"{indent(isize, ichar)}import {pkg}"
    return "\n".join([format_import(i) for i in imports]) + BR


def def_object(name: str, parameters: list[str] = [], parent_name: str = "", content: str = "",
               object_type="object", isize: int = 0, ichar: str = ' ') -> str:
    """General scala object definition.

    Parameters
    ----------
    name : str
        Name of the defined object.
    parameters : list[str]
        Object parameters. Applies only to classes and abstract classes.
    parent_name : str, default = ""
        When specified, the generated object will extend `parent_name`.
    content : str, default = ""
        Any formatted internals to be placed within the object definition.
    object_type : str, default = "object"
        One of: object, class, case class, abstract class
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Formatted object definition.
    """
    extension = f" extends {parent_name}" if parent_name else ""
    fmt_content = f" {{\n{indent(isize)}{content}\n}}" if content else ""
    def_size = sum([len(x) for x in parameters]) + len(extension) + len(name)
    params_inner = f",\n{indent(isize+4)}".join(parameters)
    params = ""
    if def_size > 100:
        params = "(\n" + indent(isize+4) + params_inner + "\n)"
    elif len(parameters) > 0:
        params = "(" + params_inner + ")"
    return f"{indent(isize, ichar)}{object_type} {name}{params}{extension}{fmt_content}\n"


def def_class(name: str, parameters: list[str] = [], parent_name: str = "",
              content: str = "", class_type: str = "", isize: int = 0,
              ichar: str = ' ') -> str:
    """General scala class definition.

    Parameters
    ----------
    name : str
        Name of the generated class.
    parameters : list[str]
        Class parameters.
    parent_name : str, default = ""
        When specified, the generated class will extend `parent_name`.
    content : str, default = ""
        Any formatted internals to be placed within the class definition.
    class_type : str, default = ""
        One of: "", case, abstract
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Formatted object definition.
    """
    class_prefix = f"{class_type} " if class_type else ""
    class_type = class_prefix + "class"
    return def_object(name, parameters, parent_name, content, class_type, isize, ichar)


def def_value(name: str, value: str, override: bool = False, isize: int = 0,
              ichar: str = ' ') -> str:
    """Generate scala val definition.

    Parameters
    ----------
    name : str
        Name of the value.
    value : str, default = ""
        Value to be assigned to the val.
    override : bool, default = False
        If the value is overrided.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Formatted val definition.
    """
    return f"""{indent(isize, ichar)}{"override " if override else ""}val {name} = {value}"""


def def_io(content: str, isize: int = 2, ichar: str = ' ') -> str:
    """Generate chisel3 io field definition.

    Parameters
    ----------
    content : str, default = ""
        Formatted fields of the io.
    isize : int, default=0
        Size of the indent.
    ichar : str, default=' '
        Character to be used when generating the indent.

    Returns
    -------
    str
        Formatted io definition.
    """
    return def_value("io",  f"IO(new Bundle {{\n{content}\n{indent(isize, ichar)}}})", isize=isize)


if __name__ == "__main__":
    from gen_accelerator_integration import gen_integration
    from gen_registers_definition import gen_reg_def
    from gen_csr_map import gen_csr_map
    from gen_accelerator_wrapper import gen_wrapper
    from validate_config import validate_config

    parser = argparse.ArgumentParser(
        description="AIG Accelerator Integration Infrastructure Generator")
    parser.add_argument("--config-path", default=DEF_CONFIG_PATH,
                        type=str, help="Configuration file path")
    parser.add_argument("--accelerator-integration-path",
                        default=DEF_INTEGRATION_PATH, type=str, help="Path for AcceleratorIntegration file")
    parser.add_argument("--accelerator-path",
                        default=DEF_WRAPPER_PATH, type=str, help="Path for Accelerator file")
    parser.add_argument("--csr-map-path",
                        default=DEF_CSR_MAP_PATH, type=str, help="Path for CSRMap file")
    parser.add_argument("--register-definition-path",
                        default=DEF_REG_DEF_PATH, type=str, help="Path for RegisterDefinition file")

    args = parser.parse_args()
    config_path = args.config_path
    validate_config(config_path)
    gen_wrapper(config_path, args.accelerator_path)
    gen_integration(config_path, args.accelerator_integration_path)
    gen_reg_def(config_path, args.register_definition_path)
    gen_csr_map(config_path, args.csr_map_path)
