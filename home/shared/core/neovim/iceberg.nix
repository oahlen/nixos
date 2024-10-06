{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "iceberg-nvim";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "oahlen";
    repo = "iceberg.nvim";
    rev = "e23c186d7fe08116e304e707ea9ffbca47fd7efa";
    sha256 = "sha256-9J2GeWhl7uSdRNahBMkpD7AyBFVDYY5h4Xnj+G6876M=";
  };

  meta.homepage = "https://github.com/oahlen/iceberg.nvim/";
}
