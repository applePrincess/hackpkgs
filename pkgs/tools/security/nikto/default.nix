{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "nikto";
  src = fetchFromGitHub {
    owner = "sullo";
    repo = name;
    rev = "2aa550f70e53212c76693b78c6960aadcf8443f2";
    sha256 = "1q0ldwdcrz4xc5r88sharyxm8h5y7dxk61zkiwd5p056n5x5lm6d";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp -r program/* $out/bin
  '';
}
