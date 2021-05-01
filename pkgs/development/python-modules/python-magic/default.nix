{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "python-magic";
  version = "0.4.22";

  src = fetchPypi {
    inherit pname version;
    sha256 = "ca884349f2c92ce830e3f498c5b7c7051fe2942c3ee4332f65213b8ebff15a62";
  };
}
