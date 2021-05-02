{ stdenv, lib, fetchzip, libpcap }:
stdenv.mkDerivation rec {
  name = "netdiscover";
  version = "0.3-pre-beta7";

  src = fetchzip {
    url = "mirror://sourceforge/${name}/${name}-${version}-LINUXONLY.tar.gz";
    sha256 = "sha256-r3Zpobfogt4usplF0VDbXH+hR0uajQ3DaASgPC3+OyM=";
  };

  buildInputs = [
    libpcap
  ];

  meta = {
    platforms = lib.platforms.linux;
  };
}
