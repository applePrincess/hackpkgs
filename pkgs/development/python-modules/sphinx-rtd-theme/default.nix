{ buildPythonPackage, fetchPypi, sphinx, docutils, nodejs }:
buildPythonPackage rec {
  pname = "sphinx-rtd-theme";
  version = "0.5.2";

  src = fetchPypi {
    pname = builtins.replaceStrings ["-"] ["_"] pname;
    inherit version;
    sha256 = "32bd3b5d13dc8186d7a42fc816a23d32e83a4827d7d9882948e7b837c232da5a";
  };

  propagatedBuildInputs = [
    sphinx
    docutils
    nodejs
  ];

  doCheck = false;
}
