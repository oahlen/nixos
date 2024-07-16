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
  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    calc
    curl
    dos2unix
    fd
    libimobiledevice
    neovim
    ripgrep
    unzip
    wget
    zip
    nfs-utils
  ];
}
