{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pyminifier";
  version = "2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e192618fe901830e9298825b32828bc9555ae8649e05af37bfab2db328546777";
  };

  doCheck = false;
}
