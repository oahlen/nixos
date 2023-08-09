{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.chromium.enable = true;

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
    dbeaver
    docker-compose
    dotnet-sdk_7
    iwgtk
    keepassxc
    libreoffice-fresh
    nodejs
    pqrs
    prismlauncher
    quickemu
    virt-manager
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "23.05";
}
