{pkgs, ...}: {
  imports = [
    ../../programs
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

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
    dotnet-sdk_7
    firefox
    iwgtk
    keepassxc
    libreoffice-fresh
    mpv
    nodejs
    pqrs
    quickemu
    rbw
    virt-manager
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "23.05";
}
