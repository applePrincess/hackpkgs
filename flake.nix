{
  description = "Hackpkg flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { system = system; };
      in rec {
        packages = flake-utils.lib.flattenTree {
          dirbuster = pkgs.callPackage ./pkgs/tools/security/dirbuster { };

          exploitdb = pkgs.callPackage ./pkgs/tools/security/exploitdb { };

          GTFOBLookup = pkgs.callPackage ./pkgs/tools/security/GTFOBLookup { };

          msodbcsql = pkgs.callPackage ./pkgs/development/libraries/msodbcsql { };

          mssql-tools = pkgs.callPackage ./pkgs/applications/misc/mssql-tools { };

          nikto = pkgs.callPackage ./pkgs/tools/security/nikto { };

          # pwncat = pkgs.pythonPackages.callPackage ./pkgs/tools/security/pwncat {} ;

          stegsolve = pkgs.callPackage ./pkgs/tools/security/stegsolve { };
        };
      }
    );
}
