{ buildPythonPackage, fetchFromGitHub }:
buildPythonPackage rec {
  pname = "pyzbar";
  version = "0.1.8";

  src = fetchFromGitHub {
    owner = "NaturalHistoryMuseum";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-VEMfGCqXErNI4RJKKc3Mly5KytciahD//zRtcctzFLs=";
  };

  doCheck = false;
}
