{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/rbw.nix
    ./kanshi.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.firefox.enable = true;
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
    awscli2
    dbeaver
    dotnet-sdk_7
    iwgtk
    jetbrains.rider
    keepassxc
    libreoffice-fresh
    nodejs
    podman-compose
    pqrs
    prismlauncher
    steam-run
    virt-manager
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "23.05";
}
