{pkgs ? import <nixpkgs> {} }:
with pkgs;
rec {
  inherit (python3.pkgs) buildPythonPackage;
  pythonPackages = callPackage ./python-packages.nix { pkgs = newPkgs; stdenv = newPkgs.stdenv; python = python3; };

  dirbuster =  callPackage ./pkgs/tools/security/dirbuster { };

  # empire = python3.callPackage ./pkgs/tools/security/empire { };

  exploitdb = callPackage ./pkgs/tools/security/exploitdb { };

  GTFOBLookup = callPackage ./pkgs/tools/security/GTFOBLookup { };

  msodbcsql = callPackage ./pkgs/development/libraries/msodbcsql { };

  nikto = callPackage ./pkgs/tools/security/nikto { };

  pwncat = pythonPackages.callPackage ./pkgs/tools/security/pwncat {} ;

  stegsolve = callPackage ./pkgs/tools/security/stegsolve { };

  zsteg = callPackage ./pkgs/tools/security/zsteg { lib = newLib; };

}
