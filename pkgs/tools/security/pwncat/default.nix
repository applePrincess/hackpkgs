{ lib, buildPythonApplication, fetchFromGitHub, colorama, netifaces, pygments,
  prompt_toolkit, requests, rich, sqlalchemy, python-rapidjson, callPackage,
  # base64io, paramiko
}:

let base64io = callPackage ../../../development/python-modules/base64io {};
    paramiko = callPackage ../../../development/python-modules/paramiko {};
in

buildPythonApplication rec {

  pname = "pwncat";
  version = "0.3.1";
  
  src = fetchFromGitHub {
    owner = "calebstewart";
    repo = pname;
    rev = "67cdcb2972be849fad777e208ee686604a3981ab";
    sha256 = "0bymy9r30lrjdgk4rb339ydpcawwk39vqsc84d8gqyzzp6wpd3i1";
  };

  propagatedBuildInputs = [
    base64io
    colorama
    netifaces
    paramiko
    prompt_toolkit
    pygments
    requests
    rich
    sqlalchemy
    python-rapidjson
  ];
  patches = [
    ./no-package-from-github.patch
    ./remove-indirectly-used-setup.patch
    ./remove-indirectly-used-requirements.patch
    # ./allow-newer.patch
  ];
  postPatch = ''
    sed -i 's/==.*//' requirements.txt
  '';

  doCheck = false;
  # meta = {
  #  
  # };
}
