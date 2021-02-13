{buildPythonPackage, fetchPypi }:
buildPythonPackage rec {
  pname = "PyYAML";
  version = "5.4.1";
  src = fetchPypi {
    inherit pname version;
    sha256 = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e";
  };
}
