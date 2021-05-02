{ lib, buildPythonPackage, fetchPypi, callPackage }:
buildPythonPackage rec {
  pname = "zlib_wrapper";
  version = "0.1.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "631a9cedf48376700f9462f34db81c110c624ca24348998f826d1e57ad898864";
  };
}
