{ buildPythonApplication, fetchFromGitHub, beautifulsoup4, certifi, colorama, lxml,
  pysocks, requests, requests-futures, soupsieve, stem, torrequest
}:
buildPythonApplication rec {
  pname = "sherlock";
  version = "0.14.0";
  srcs = fetchFromGitHub {
    owner = "applePrincess";
    repo = pname;
    rev = "774c0940648acebaf5af9a40c7a296b8acdb017e";
    sha256 = "sha256-663nTOWBhTCsYQmTt2PXkZZdb/6PR/p4+lTwtNndXlo=";
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
