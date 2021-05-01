{ buildPythonPackage, fetchPypi, pyperclip }:

buildPythonPackage rec {
  pname = "clipboard";
  version = "0.0.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a72a78e9c9bf68da1c3f29ee022417d13ec9e3824b511559fd2b702b1dd5b817";
  };

  propagatedBuildInputs = [
    pyperclip
  ];
}
