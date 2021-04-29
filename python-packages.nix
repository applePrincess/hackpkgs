{ pkgs, stdenv , python }:

python.pkgs // rec {

  altgraph = python.pkgs.callPackage ./pkgs/development/python-modules/altgraph { };
  argparse = python.pkgs.callPackage ./pkgs/development/python-modules/argparse { };
  base64io = python.pkgs.callPackage ./pkgs/development/python-modules/base64io { };
  Flask = python.pkgs.callPackage ./pkgs/development/python-modules/Flask { };
  flasgger = python.pkgs.callPackage ./pkgs/development/python-modules/flasgger { };
  macholib = python.pkgs.callPackage ./pkgs/development/python-modules/macholib { };
  paramiko = python.pkgs.callPackage ./pkgs/development/python-modules/paramiko { };
  pyinstaller = python.pkgs.callPackage ./pkgs/development/python-modules/pyinstaller { };
  pyminifier = python.pkgs.callPackage ./pkgs/development/python-modules/pyminifier { };
  pyinstaller-hooks-contrib = python.pkgs.callPackage ./pkgs/development/python-modules/pyinstaller-hooks-contrib { };
  PyYAML = python.pkgs.callPackage ./pkgs/development/python-modules/PyYAML { };
  requests-futures = python.pkgs.callPackage ./pkgs/development/python-modules/requests-futures { };
  sublist3r = python.pkgs.callPackage ./pkgs/tools/security/sublist3r { argparse = argparse; };
  torrequests = python.pkgs.callPackage ./pkgs/development/python-modules/torrequests { };
  xlutils = python.pkgs.callPackage ./pkgs/development/python-modules/xlutils { };
  zlib_wrapper = python.pkgs.callPackage ./pkgs/development/python-modules/zlib_wrapper { };

  # # empire = python.pkgs.callPackage ./pkgs/tools/security { };
  httpbin = python.pkgs.callPackage ./pkgs/servers/httpbin { };
}
