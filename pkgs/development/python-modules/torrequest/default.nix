{ buildPythonPackage, fetchFromGitHub, requests }:
buildPythonPackage rec {
  pname = "torrequests";
  version = "1.1.10";

  src = fetchFromGitHub {
    repo = pname;
    owner = "applePrincess";
    rev = "2aa0e017945545345f26eea810700122912ad06a";
    sha256 = "sha256-xgR4dJ+yPFRqi6orbuVW5b4VymUURBpBB9EVGGzObHI=";
  };

  propagatedBuildInputs = [ requests ];

  doCheck = false;
}
