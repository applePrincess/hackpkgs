{ buildPythonApplication, fetchFromGitHub,
  itsdangerous,
  flasgger,
  raven,
  decorator,
  brotlipy,
  gevent,
  callPackage
}:
buildPythonApplication rec {
  pname = "httpbin";
  version = "0.9.2";
  src = fetchFromGitHub {
    owner = "postmanlabs";
    repo = pname;
    rev = "f8ec666b4d1b654e4ff6aedd356f510dcac09f83";
    sha256 = "1rwkb13p76zz18ryrcc0f5f3civgvvn0d1lq28x266smyrjqkg17";
  };
  propagatedBuildInputs = [
    itsdangerous
    flasgger
    raven
    decorator
    brotlipy
    gevent
  ];
  doCheck = false;
}
