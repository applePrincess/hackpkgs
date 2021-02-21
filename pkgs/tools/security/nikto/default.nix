{ stdenvNoCC, fetchFromGitHub, perl }:
let perlenv = perl.withPackages (pp: with pp; [
      NetSSLeay
    ]);
in
stdenvNoCC.mkDerivation rec {
  name = "nikto";
  src = fetchFromGitHub {
    owner = "sullo";
    repo = name;
    rev = "2aa550f70e53212c76693b78c6960aadcf8443f2";
    sha256 = "1q0ldwdcrz4xc5r88sharyxm8h5y7dxk61zkiwd5p056n5x5lm6d";
  };

  buildInputs = [ perlenv ];

  output = ["bin" "doc" "devDoc" "man" ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/doc
    mkdir -p $out/devDoc
    mkdir -p $out/man/man1
    cp -r program/* $out/bin
    cp -r documentation/* $out/doc
    cp -r devdocs/* $out/devDoc
    cp documentation/nikto.1 $out/man/man1/
  '';
}
