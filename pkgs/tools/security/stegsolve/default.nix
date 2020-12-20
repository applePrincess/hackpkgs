{stdenv, fetchFromGitHub, jdk, jre, makeWrapper }:
stdenv.mkDerivation rec {
  name = "stegsolve";
  version = "1.5";
  src = fetchFromGitHub {
    owner = "Giotino";
    repo = name;
    rev = "v.${version}";
    sha256 = "16a7anam2ry6894f9xr341dl1k8g1mzpmh7x0sg45bax1s87liwj";
  };
  nativeBuildInputs = [ jdk makeWrapper jre ];
  buildPhase = ''
    javac stegsolve/*.java
    jar -cvfm stegsolve.jar META-INF/MANIFEST.MF stegsolve/*.class
    rm stegsolve/*.class
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/java
    mv stegsolve.jar $out/share/java/stegsolve.jar
    makeWrapper ${jre}/bin/java $out/bin/stegsolve \
      --add-flags "-jar $out/share/java/stegsolve.jar"
  '';
  # http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
}
