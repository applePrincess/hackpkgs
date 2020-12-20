{pkgs ? import <nixpkgs> {} }:
with pkgs;
rec {
  inherit (python3.pkgs) buildPythonPackage;
  pythonPackages = callPackage ./python-packages.nix { inherit stdenv pkgs; python = python3; };
  
  dirbuster =  callPackage ./pkgs/tools/security/dirbuster { };
  # pwncat = callPackage ./pwncat { inherit stdenv pkgs; buildPythonApplication = python3.buildPythonApplication; };
  pwncat = pythonPackages.callPackage ./pkgs/tools/security/pwncat {} ;

  stegsolve = callPackage ./pkgs/tools/security/stegsolve { };

  zsteg = callPackage ./pkgs/tools/security/zsteg { };
 
}
