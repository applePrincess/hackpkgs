{ buildPythonPackage, fetchPypi, requests }:

buildPythonPackage rec {
  pname = "requests-futures";
  version = "1.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "35547502bf1958044716a03a2f47092a89efe8f9789ab0c4c528d9c9c30bc148";
  };

  propagatedBuildInputs = [ requests ];

  doCheck = false;
}
