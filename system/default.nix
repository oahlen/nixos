{pkgs, ...}: {
  imports = [
    ./doas.nix
    ./env.nix
    ./flatpak.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./pipewire.nix
    ./sway.nix
    ./tailscale.nix
    ./thunar.nix
  ];

  # Very important system packages
  environment.systemPackages = with pkgs; [
    calc
    curl
    fd
    git
    dos2unix
    neovim
    ripgrep
    unzip
    wget
    zip
  ];
}
