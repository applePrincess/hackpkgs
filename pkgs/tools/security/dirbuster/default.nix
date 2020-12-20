{stdenv, fetchFromGitLab, jre, makeWrapper }:

stdenv.mkDerivation rec {
  name = "dirbuster";
  version = "1.0-RC1";

  src = fetchFromGitLab {
    owner = "kalilinux/packages";
    repo = name;
    rev = "9edc0490c05f669a9bfc9d63772fd2a8aaa18daa";
    sha256 = "1hv7yii1bgx275mpv2b8i8qmy62whpl4ijnq7xy64yg3qsn2j7n6";
  };

  installPhase = ''
     mkdir -p $out/bin $out/share/$name $out/lib
     cp ./directory*.txt "./DirBuster-${version}.jar" $out/share/$name
     cp lib/*.jar $out/lib
     makeWrapper ${jre}/bin/java $out/bin/$name \
       --add-flags "-jar $out/share/$name/DirBuster-${version}.jar"
  '';

  nativeBuildInputs = [ makeWrapper jre ];
}
