{ stdenv, python3, callPackage, fetchFromGitHub, makeWrapper }:
let pyenv = python3.withPackages (ps: with ps; [
      appdirs
      colorama
      GitPython
      pyyaml
    ]);
in
stdenv.mkDerivation rec {
  name = "GTFOBLookup";
  version = "0.0.1";
  src = fetchFromGitHub {
    repo = name;
    owner = "nccgroup";
    rev = "949a9c18b7f0dbb48e97fd42b3e71931832830fc";
    sha256 = "bqH4myxxNQR57itUlnGFSYGe+0moXanT04eY/KF0u7I=";
  };

  dontBuild = true;

  buildInputs = [ pyenv ];

  output = ["bin" "out" "man" ];

  installPhase = ''
    mkdir -p $out/bin
    cp gtfoblookup.py $out/bin
    mkdir -p $out/man/man1
    cp gtfoblookup.1 $out/man/man1/
  '';
}
