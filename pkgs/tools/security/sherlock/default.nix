{ stdenv, fetchFromGitHub, python3, requests-futures, torrequest, makeWrapper }:
let pyenv = python3.withPackages (pp: with pp; [
      beautifulsoup4
      certifi
      colorama
      lxml
      pysocks
      requests
      requests-futures
      soupsieve
      stem
      torrequest
    ]);
in
stdenv.mkDerivation rec {
  pname = "sherlock";
  version = "0.14.0";
  srcs = fetchFromGitHub {
    owner = "applePrincess";
    repo = pname;
    rev = "2282dcf9c4e40c5af3e1b5aae6099a53587f1090";
    sha256 = "sha256-Ro0LrGan9Ear2jYAD/xmeEPlyYMpzBD3uCu/R9Zs8D4=";
  };

  buildInputs = [ pyenv makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/bin/resources
    cp ./sherlock/*.py $out/bin/
    cp --recursive ./sherlock/resources/ $out/bin/
    ls $out/bin/
    makeWrapper ${pyenv}/bin/python3 $out/bin/sherlock --add-flags "$out/bin/sherlock.py"
  '';
  doCheck = false;
}
