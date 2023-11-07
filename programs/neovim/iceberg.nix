{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "eae74821df5a25ddd77ef3e8e338acefe419d034";
    sha256 = "Z/aJCeapXhM+8SyNfgz1uKlkUd9thUb7IYMmNbAGhus=";
  };
  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
