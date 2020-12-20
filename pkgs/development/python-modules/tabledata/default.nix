{ lib, buildPythonPackage, fetchPypi, callPackage }:
let typepy = callPackage ../typepy {};
    DataProperty = callPackage ../DataProperty {};
in
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
