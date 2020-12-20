{ lib, buildPythonPackage, fetchFromGitHub, pynacl, bcrypt, invoke, pyasn1, 
  gssapi, cryptography, pytest, pytest-relaxed }:

buildPythonPackage rec {
  pname = "paramiko";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname; 
    rev = "5cf145ffd3d7cd4d96a511376267a7f27cce5eed";
    sha256 = "1hwa951rqgdwzfckk0kjhlcd58qb48h89q831b709b50mb6qmjry";
  };

  patches = [
    ./fork-work.patch
  ];

  doCheck = false;

  checkInputs = [
    pytest
    pytest-relaxed
  ];

  propagatedBuildInputs = [
    pynacl
    bcrypt
    invoke
    pyasn1
    gssapi
    cryptography
  ];

  meta = with lib; {
    homepage = "https://github.com/paramiko/paramiko/";
    description = "SSH2 protocol library";
    licenses = licenses.lgpl;
    maintainers = with maintainers; [ applePrincess ];
  };

}
