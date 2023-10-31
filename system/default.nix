{pkgs, ...}: {
  imports = [
    ./doas.nix
    ./env.nix
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
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
  ];
}
