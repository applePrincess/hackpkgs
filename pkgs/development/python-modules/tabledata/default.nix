{ lib, buildPythonPackage, fetchPypi, callPackage, typepy, DataProperty }:
buildPythonPackage rec {
  pname = "tabledata";
  version = "1.1.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18knvyagjngps924ikclpbxkx3a17xsawqqhwajqq6dvbjsjsk7s";
  };
  doCheck = false;
  propagatedBuildInputs = [ typepy DataProperty ];
}
