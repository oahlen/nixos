{pkgs, ...}: {
  imports = [
    ./doas.nix
    ./env.nix
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
    curl
    git
    neovim
    unzip
    wget
    zip
  ];
}
