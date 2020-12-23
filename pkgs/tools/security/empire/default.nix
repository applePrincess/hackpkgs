{ stdenv, lib, fetchFromGitHub, xar, bomutils, powershell, makeWrapper, 
  python3, staging_key ? "RANDOM",
  # macholib Could be for only MacOS? ignore for now
}:

let zlib_wrapper = python3.pkgs.callPackage ../../../development/python-modules/zlib_wrapper { };
    pyinstaller = python3.pkgs.callPackage ../../../development/python-modules/pyinstaller { };
    pyminifier = python3.pkgs.callPackage ../../../development/python-modules/pyminifier { };
    xlutils = python3.pkgs.callPackage ../../../development/python-modules/xlutils { };
    macholib = python3.pkgs.callPackage ../../../development/python-modules/macholib { };
    pyenv = python3.withPackages (ps: with ps; [
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

  STAGING_KEY=staging_key;

  buildPhase = ''
    cd setup
    ${pyenv}/bin/python ./setup_database.py
    sh ./cert.sh
    cd ..
  '';

  installPhase = ''
    mkdir $out
    cp -R ./* $out
    substitute $out/empire $out/empire \
      --replace "#!/usr/bin/env python3" "#!${pyenv}/bin/python3"
  '';
  
}
