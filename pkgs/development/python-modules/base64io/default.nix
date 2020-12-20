{ lib, buildPythonPackage, fetchFromGitHub }:
buildPythonPackage rec {
  pname = "base64io-john";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "JohnHammond";
    repo = "base64io-python";
    rev = "8348c3545b1a25bd088f5acb936b9ff2389a2f8e";
    sha256 = "16609xvpkcr35yw1rg6icx49igs2sp24iimm4ba502bqy580zcc7";
  };

  meta = with lib; {
    description = "A stream implementation for Python that provides transparent base64 encoding and decoding of an underlying stream.";
    homepage = "https://github.com/JohnHammond/base64io-python";
    license = licenses.asl20;
    maintainers = with maintainers; [ applePrincess ];
  };
}
