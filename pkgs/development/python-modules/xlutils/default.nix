{ lib, buildPythonPackage, fetchPypi, callPackage, xlwt, xlrd }:
buildPythonPackage rec {
  pname = "xlutils";
  version = "2.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7e0e2c233bd185fecf5e2bd3f4e9469ca4a3bd87da64c82cfe5b2af27e7f9e54";
  };
  doCheck = false;
  propagatedBuildInputs = [
    xlwt
    xlrd
  ];
}
