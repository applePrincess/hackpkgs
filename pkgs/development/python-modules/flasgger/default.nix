{ buildPythonPackage, fetchPypi,
  PyYAML,
  mistune,
  jsonschema,
  Flask,
  callPackage
}:
buildPythonPackage rec {
  pname = "flasgger";
  version = "0.9.5";
  src = fetchPypi {
    inherit pname version;
    sha256 = "6ebea406b5beecd77e8da42550f380d4d05a6107bc90b69ce9e77aee7612e2d0";
  };
  propagatedBuildInputs = [
    PyYAML
    mistune
    jsonschema
    Flask
  ];
  doCheck = false;
}
