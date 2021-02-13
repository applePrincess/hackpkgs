{ buildPythonPackage, fetchPypi,
  itsdangerous,
  jinja2,
  click,
  werkzeug
}:
buildPythonPackage rec {
  pname = "Flask";
  version = "1.1.2";
  src = fetchPypi {
    inherit pname version;
    sha256 = "4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060";
  };
  propagatedBuildInputs = [
    itsdangerous
    jinja2
    click
    werkzeug
  ];
}
