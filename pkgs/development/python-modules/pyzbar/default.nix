{ buildPythonPackage, fetchPypi }:
buildPythonPackage rec {
  pname = "pyzber";
  version = "0.1.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0e204b904e093e5e75aa85e0203bb0e02888105732a509b51f31cff400f34265";
  };

  doCheck = false;
}
