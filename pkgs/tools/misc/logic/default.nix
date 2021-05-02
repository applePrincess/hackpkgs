{ appimageTools, fetchurl }:
appimageTools.wrapType2 {
  name = "logic";
  src = fetchurl {
    url = "https://logic2api.saleae.com/download?os=linux";
    sha256 = "c2993c454fe8c7f44ef3f1c066a469ebd0e2479eaa5ce310c90421b2dee4393a";
  };

  extraPkgs = pkgs: with pkgs; [
    gsettings-desktop-schemas
    wget
  ];
}
