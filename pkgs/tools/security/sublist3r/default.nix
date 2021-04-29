{ buildPythonApplication, fetchFromGitHub,
  argparse, dnspython, requests
}:
buildPythonApplication rec {
  pname = "sublist3r";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "aboul3la";
    repo = pname;
    rev = version;
    sha256 = "sha256-X1p5lCIZTU+xZZSsNtf/liiqkDlgaufY8hC4ZDqF6cw=";
  };

  propagatedBuildInputs = [
    argparse
    dnspython
    requests
  ];

  catchConflicts = false; # TODO: for whatever reason it thinks it is.
}
