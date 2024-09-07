{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
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

  programs.rbw.enable = true;

  home.packages = with pkgs; [
    awscli2
    dbeaver-bin
    iwgtk
    jetbrains.rider
    keepassxc
    libreoffice-fresh
    mgba
    pinta
    podman-compose
    prismlauncher
    virt-manager
  ];

  home.stateVersion = "23.05";
}
