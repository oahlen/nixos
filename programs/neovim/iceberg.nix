{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "366c48a6099410507f8f4208c4dcdc58ef6e7edc";
    sha256 = "sha256-ShXtVKhAgnQt3rNjVb6uE+Bm7/7vKvAWI1RoHWlCGuM=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
