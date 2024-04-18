{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "1356f7979939782d383013c0c093530401693844";
    sha256 = "sha256-MusE2mNnQ7VH8L/z68UIwKaSU/eEPyw3rkqOY9E/e/4=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
