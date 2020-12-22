{ pkgs, stdenv , python }:

# with pkgs.lib;
# 
# self:
# 
# let
#   inherit (self) callPackage;
#   inherit (python.passthru) isPy27 isPy35 isPy36 isPy37 isPy38 isPy39 isPy3k isPyPy pythonAtLeast pythonOlder;
# 
#   namePrefix = python.libPrefix + "-";
# 
#   # Derivations built with `buildPythonPackage` can already be overriden with `override`, `overrideAttrs`, and `overrideDerivation`.
#   # This function introduces `overridePythonAttrs` and it overrides the call to `buildPythonPackage`.
#   makeOverridablePythonPackage = f: origArgs:
#     let
#       ff = f origArgs;
#       overrideWith = newArgs: origArgs // (if pkgs.lib.isFunction newArgs then newArgs origArgs else newArgs);
#     in
#       if builtins.isAttrs ff then (ff // {
#         overridePythonAttrs = newArgs: makeOverridablePythonPackage f (overrideWith newArgs);
#       })
#       else if builtins.isFunction ff then {
#         overridePythonAttrs = newArgs: makeOverridablePythonPackage f (overrideWith newArgs);
#         __functor = self: ff;
#       }
#       else ff;
# 
#   # Get list of required Python modules given a list of derivations.
#   requiredPythonModules = drvs: let
#     modules = filter hasPythonModule drvs;
#   in unique ([python] ++ modules ++ concatLists (catAttrs "requiredPythonModules" modules));
# 
#   removePythonPrefix = name:
#     removePrefix namePrefix name;
#   buildPythonApplication = python.pkgs.buildPythonApplication;
#   buildPythonPackage = python.pkgs.buildPythonPackage;
#   toPythonModule = python.pkgs.toPythonModule;
#   toPythonApplication = python.pkgs.toPythonApplication;
#   disabledIf = python.pkgs.disabledIf;
#   makePythonPath = python.pkgs.makePythonPath;
#   bootstrapped-pip = python.pkgs.bootstrapped-pip;
#   hasPythonModule = python.pkgs.hasPythonModule;
#   buildSetupcfg = python.pkgs.buildSetupcfg;
# in 
python.pkgs // {

  altgraph = python.callPackage ./pkgs/development/python-modules/altgraph { };
  base64io = python.callPackage ./pkgs/development/python-modules/base64io { };
  paramiko = python.callPackage ./pkgs/development/python-modules/paramiko { };
  pyinstaller = python.callPackage ./pkgs/development/python-modules/pyinstaller { };
  pyminifier = python.callPackage ./pkgs/development/python-modules/pyminifier { };
  pyinstaller-hooks-contrib = python.callPackage ./pkgs/development/python-modules/pyinstaller-hooks-contrib { };
  zlib_wrapper = python.callPackage ./pkgs/development/python-modules/zlib_wrapper { };
}
