{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/firefox.nix
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

  programs.chromium.enable = true;
  programs.rbw.enable = true;

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
