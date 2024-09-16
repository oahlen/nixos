{pkgs, ...}: {
  imports = [
    ./env.nix
    ./fhs.nix
    ./fonts.nix
    ./gaming
    ./kernel.nix
    ./locale.nix
    ./nix.nix
    ./security.nix
    ./systemd.nix
  ];

  # Very important system packages
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = false;
    withPython3 = false;
    withRuby = false;
  };

  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    calc
    curl
    dos2unix
    fd
    ripgrep
    unzip
    wget
    zip
    nfs-utils
  ];
}
