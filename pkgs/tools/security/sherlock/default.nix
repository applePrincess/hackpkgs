{ buildPythonApplication, fetchFromGitHub, beautifulsoup4, certifi, colorama, lxml,
  pysocks, requests, requests-futures, soupsieve, stem, torrequest
}:
buildPythonApplication rec {
  pname = "sherlock";
  version = "0.14.0";
  srcs = fetchFromGitHub {
    owner = "applePrincess";
    repo = pname;
    rev = "2282dcf9c4e40c5af3e1b5aae6099a53587f1090";
    sha256 = "sha256-Ro0LrGan9Ear2jYAD/xmeEPlyYMpzBD3uCu/R9Zs8D4=";
  };

  propagatedBuildInputs = [
    beautifulsoup4
    # bs4
    certifi
    colorama
    lxml
    pysocks
    requests
    requests-futures
    soupsieve
    stem
    torrequest
  ];

  doCheck = false;
}
