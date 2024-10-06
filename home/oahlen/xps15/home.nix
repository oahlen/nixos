{pkgs, ...}: {
  imports = [
    ../../shared/core
    ../../shared/optional/desktops/sway
    ../../shared/optional/programs/idea
    ../../shared/optional/programs/rbw.nix
    ./kanshi.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # hidpi cursor setting
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  programs.firefox.enable = true;
  programs.chromium.enable = true;

  home.packages = with pkgs; [
    dbeaver-bin
    iwgtk
    jetbrains.rider
    libreoffice-fresh
    podman-compose
    virt-manager
  ];

  home.stateVersion = "23.05";
}
