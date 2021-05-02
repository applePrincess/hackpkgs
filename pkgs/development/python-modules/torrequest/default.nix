{ buildPythonPackage, fetchFromGitHub, requests, pysocks, stem }:
buildPythonPackage rec {
  pname = "torrequest";
  version = "0.1.0";

  src = fetchFromGitHub {
    repo = pname;
    owner = "erdiaker";
    rev = "8c1b5d0b90bbc5f302cc624a8ae61545542b99f4";
    sha256 = "sha256-rhmpWWIO1ZPfdC//VPjUPeajB5cUHjrHUHX/daL69Zo=";
  };

  propagatedBuildInputs = [ pysocks requests stem ];

  doCheck = false;
}
