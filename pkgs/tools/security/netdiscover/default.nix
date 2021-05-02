{ stdenv, fetchFromGitHub, autoconf, automake, libpcap, libnet }:

stdenv.mkDerivation rec {
  name = "netdiscover";
  version = "0.7";

  src =fetchFromGitHub {
    owner = "netdiscover-scanner";
    repo = name;
    rev = version;
    sha256 = "sha256-0iMOWhT6ApkKJyyUdn2JnKN89rHeNhL7irqZ8GhGHD0=";
  };

  preConfigure = "./autogen.sh";

  buildInputs = [
    autoconf
    automake
    libpcap
    libnet
  ];
}
