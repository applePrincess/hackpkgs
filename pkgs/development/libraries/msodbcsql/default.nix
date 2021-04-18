{ stdenv, fetchurl, lib }:
stdenv.mkDerivation {
  name = "msodbcsql";
  version = "17.7.2.1-1";
  src = fetchurl {
    url = "https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.7.2.1-1_amd64.apk";
    sha256 = "sha256-UCldnsVF76oa5cQ5JCHL9oEoNflcr6GxFzwiXnLhwIk=";
  };
  dontBuild = true;
  unpackPhase = ''
    tar -zxf $src
  '';

  installPhase = ''
    mkdir $out
    mv opt/microsoft/msodbcsql17/* $out/
    mv usr/share/doc $out/
  '';
  outputDirs = [
    "etc"
    "include"
    "lib64"
    "share"
    "doc"
  ];

  meta = with lib; {
    homepage = "https://docs.microsoft.com/en-us/sql/connect/odbc/microsoft-odbc-driver-for-sql-server";
    maintainers = [ maintainers.applePrincess ];
    description = "ODBC Driver for SQL Server";
    license = licenses.unfreeRedistributable;
  };
}
