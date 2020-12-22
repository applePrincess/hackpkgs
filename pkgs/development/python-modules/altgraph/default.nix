{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "altgraph";
  version = "0.17";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1f05a47122542f97028caf78775a095fbe6a2699b5089de8477eb583167d69aa";
 };
}
