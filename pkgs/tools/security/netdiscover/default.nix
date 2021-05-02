{ stdenv, fetchurl, libpcap }:

stdenv.mkDerivation rec {
  name = "netdiscover";
  version = "0.3-pre-beta7";

  src = fetchurl {
    url = "mirror://sourceforge/${name}/${name}-${version}-LINUXONLY.tar.gz";
    sha256 = "sha256-AcbgkMOwbjdABffvzq07Wy9j9Hv7lDg8Hb3pq88c2Ko=";
  };

  buildInputs = [
    libpcap
  ];
}
