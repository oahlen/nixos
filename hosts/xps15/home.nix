{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/rbw.nix
    ../../programs/idea
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

  home.packages = with pkgs; [
    awscli2
    dbeaver-bin
    gnome.eog
    gnome-text-editor
    mgba
    iwgtk
    keepassxc
    libreoffice-fresh
    pinta
    podman-compose
    pqrs
    prismlauncher
    steam-run
    virt-manager
  ];

  home.stateVersion = "23.05";
}
