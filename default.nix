{pkgs ? import <nixpkgs> {} }:
with pkgs;
let
  applePrincess = {
    email = "appleprincess@appleprincess.io";
    github = "applePrincess";
    githubId = 17154507;
    name = "Lein Matsumaru";
    keys = [{
      longkeyid = "rsa4096/0xAAA50652F0479205";
      fingerprint = "BF8B F725 DA30 E53E 7F11  4ED8 AAA5 0652 F047 9205";
   }];
  };
  newMaintainers = pkgs.lib.maintainers // {applePrincess = applePrincess; };
  newLib = lib // { maintainers = newMaintainers; };
  newPkgs = pkgs // { lib = newLib; };
  
in rec {
  inherit (python3.pkgs) buildPythonPackage;
  pythonPackages = callPackage ./python-packages.nix { pkgs = newPkgs; stdenv = newPkgs.stdenv; python = python3; };
  
  dirbuster =  callPackage ./pkgs/tools/security/dirbuster { };

  pwncat = pythonPackages.callPackage ./pkgs/tools/security/pwncat {} ;

  stegsolve = callPackage ./pkgs/tools/security/stegsolve { };

  zsteg = callPackage ./pkgs/tools/security/zsteg { lib = newLib; };
 
}
