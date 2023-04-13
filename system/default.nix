{pkgs, ...}: {
  imports = [
    ./doas.nix
    ./env.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./sway.nix
    ./tailscale.nix
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
