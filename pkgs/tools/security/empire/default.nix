{ stdenv, lib, fetchFromGitHub, xar, bomutils, powershell, makeWrapper,
  python3, staging_key ? "RANDOM",
  # macholib Could be for only MacOS? ignore for now
  zlib_wrapper, pyinstaller, pyminifier, xlutils, macholib
}:

let pyenv = python3.withPackages (ps: with ps; [
      urllib3
      requests
      setuptools
      iptools
      pydispatcher
      flask
      dropbox
      pyopenssl
      pyinstaller
      zlib_wrapper
      netifaces
      m2crypto
      jinja2
      cryptography
      pyminifier
      xlutils
      pefile
      simplejson
      bcrypt
      pycrypto
      pyparsing
      flask-socketio
      macholib
    ]);
in
stdenv.mkDerivation rec {
  name = "empire";
  version = "3.6.3";

  src = fetchFromGitHub {
    owner = "BC-SECURITY";
    repo = name;
    rev = "v${version}";
    sha256 = "0hqfqpymb2k2z3pf3mq8ccx7mc1n4hdawsxpbmc9hc1aj0r5ca4r";
  };

  propagatedBuildInputs = [
    xar
    bomutils
    powershell
    pyenv
    makeWrapper
  ];

  dontBuild = true;

  output = ["bin" "doc"];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/doc
    cp -R empire setup/ $out/bin
    substitute $out/empire $out/empire \
      --replace "#!/usr/bin/env python3" "#!${pyenv}/bin/python3"
  '';

}
