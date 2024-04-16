{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "4458c397c15d9ca71e947de174d0ed3e318d7da4";
    sha256 = "sha256-OA9T0K/PvBdSy5wzS5qkbFb4fQ9e9CEIp4mt2akZ/XA=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
