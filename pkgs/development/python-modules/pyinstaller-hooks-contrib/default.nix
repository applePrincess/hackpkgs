{ lib, buildPythonPackage, fetchPypi }:
buildPythonPackage rec {
  pname = "pyinstaller-hooks-contrib";
  version = "2020.11";

  src = fetchPypi {
    inherit pname version;
    sha256 = "fc3290a2ca337d1d58c579c223201360bfe74caed6454eaf5a2550b77dbda45c";
  };

}
