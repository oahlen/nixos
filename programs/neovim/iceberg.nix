{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.1";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "5f93ea6ba3157da1907340ed8061a42f57b81abd";
    sha256 = "+cc0P2RwBfzTVjgqX6Fj1sxl6sAE/W14CvEzvSoq0Q4=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
