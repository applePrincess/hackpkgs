{ stdenv, fetchFromGitHub, bash, nmap }:
stdenv.mkDerivation {
  pname = "superenum";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "p4pentest";
    repo = "SuperEnum";
    rev = "100a6ce938c4d227efd4b789be6b1eec448898f3";
    sha256 =  "sha256-PAh0lIbKJCdoEmFrEucC+TDZwOvG0cksgaFiWzwwOb8=";
  };

  buildInputs = [
    bash
    nmap
  ];

  buildPhase = ''
    patchShebangs $src/superenum
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp $src/superenum $src/commands.config $out/bin
    chmod +x $out/bin/superenum
  '';
}
