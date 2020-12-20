{ lib, buildPythonPackage, fetchPypi, callPackage }:
buildPythonPackage rec {
  pname = "tcolorpy";
  version = "0.0.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "01ll6wvi9zkmvm0kfp47s1m0vmckipm1hhpxkj6vini12dpqigpz";
 };
 doCheck = false;
}
