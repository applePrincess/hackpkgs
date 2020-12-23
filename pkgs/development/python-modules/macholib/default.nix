{ lib, buildPythonPackage, fetchPypi, callPackage }:
let altgraph = callPackage ../altgraph { };
in
buildPythonPackage rec {
  pname = "macholib";
  version = "1.14";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0c436bc847e7b1d9bda0560351bf76d7caf930fb585a828d13608839ef42c432";
  };

  propagatedBuildInputs = [
    altgraph
  ];
  doCheck = false;
}
