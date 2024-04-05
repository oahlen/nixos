{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "158a271fac719a2b38d050fa3355d5ec7dc36119";
    sha256 = "sha256-pYuEnCyKs4UUO6hK6g+hWHNtmVzwntfaGlvXDigXx+w=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
