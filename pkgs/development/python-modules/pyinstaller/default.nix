{ lib, buildPythonPackage, fetchPypi, callPackage,
  altgraph, pyinstaller-hooks-contrib
}:
buildPythonPackage rec {
  pname = "pyinstaller";
  version = "4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "954ae81de9a4bc096ff02433b3e245b9272fe53f27cac319e71fe7540952bd3d";
  };

  propagatedBuildInputs = [
    altgraph
    pyinstaller-hooks-contrib
  ];

  doCheck = false;
}
