{
  description = "Hackpkg flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import <nixpkgs> { system = system; };
      in rec {
        dirbuster = pkgs.callPackage ./pkgs/tools/security/dirbuster { };
        exploitdb = pkgs.callPackage ./pkgs/tools/security/exploitdb { };
      });
}
