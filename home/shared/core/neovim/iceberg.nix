{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "27d78d9e06a7e5b0f569f28bdd5a8cb8cda431d5";
    sha256 = "sha256-ek2rQ7aOYwI7GPZCtkA4Bp0aZQOxXgyzsJXYmX+81ac=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
