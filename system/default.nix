{pkgs, ...}: {
  imports = [
    ./doas.nix
    ./env.nix
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./tailscale.nix
  ];

  # Very important system packages
  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    calc
    curl
    fd
    dos2unix
    neovim
    ripgrep
    unzip
    wget
    zip
  ];
}
