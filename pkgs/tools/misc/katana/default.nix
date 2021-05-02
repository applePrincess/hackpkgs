{ buildPythonApplication, fetchFromGitHub,
  wheel,
  requests,
  argparse,
  python-magic,
  pyzbar,
  pillow,
  clipboard,
  jinja2,
  pyenchant,
  pycrypto,
  pytesseract,
  dulwich,
  # bs4,
  base58,
  pysocks,
  scipy,
  pydub,
  matplotlib,
  pdftotext,
  pypdf2,
  pyopenssl,
  sphinx,
  sphinx-rtd-theme,
  gmpy,
  cmd2,
  watchdog,
  regex,
  dbus-python,
  notify2,
}:
buildPythonApplication rec {
  pname = "katana";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "JohnHammond";
    repo = pname;
    rev = "2ae9440450fc263ae4d0aec1ab3e55441781e97f";
    sha256 = "sha256-w7zUxBtMVULXt4o5TnhkOXaqOWVkO7sHEQRUyFyVfXU=";
  };

  propagatedBuildInputs = [
    wheel
    requests
    argparse
    python-magic
    pyzbar
    pillow
    clipboard
    jinja2
    pyenchant
    pycrypto
    pytesseract
    dulwich
    # bs4
    base58
    pysocks
    scipy
    pydub
    matplotlib
    pdftotext
    pypdf2
    pyopenssl
    sphinx
    sphinx-rtd-theme
    gmpy
    cmd2
    watchdog
    regex
    dbus-python
    notify2
  ];
}
