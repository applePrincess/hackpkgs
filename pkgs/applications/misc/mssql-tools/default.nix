{ stdenv, fetchurl }:
stdenv.mkDerivation {
  name = "mssql-tools";
  version = "17.7.1.1-1";

  src = fetchurl {
    url = "https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.7.1.1-1_amd64.apk";
    sha256 = "sha256-PhvvQfWHQMJWBQkJFqlRG5tiBfDFEdMc9XP19SURp30=";
  };

  unpackPhase = ''
    tar zxf $src
  '';

  installPhase = ''
    mkdir $out
    mv opt/mssql-tools/bin $out
    mv opt/mssql-tools/share $out
    mv usr/share/doc $out
  '';

  dontBuild = true;
}
