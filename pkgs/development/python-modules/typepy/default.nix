{ lib, buildPythonPackage, fetchPypi, callPackage, pytz }:
let mbstrdecoder = callPackage ../mbstrdecoder {};
in
buildPythonPackage rec {
  pname = "typepy";
  version = "1.1.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1265knp6i4121i3d50rpz5lq9bvyq7ni8cxjwqgv1mkkmkp7zv5g";
 };
 doCheck = false;
 propagatedBuildInputs = [ mbstrdecoder pytz ];
}
