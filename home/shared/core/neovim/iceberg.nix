{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "b6d805c9b60ed88cc82aca48424f6a0249bc4775";
    sha256 = "sha256-2w9+4xZA8zkmJVV43nA77w1TV8fSUkGen/IWmGvjCFE=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
