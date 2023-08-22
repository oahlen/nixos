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
    awscli2
    dbeaver
    cargo
    (with dotnetCorePackages;
      combinePackages [
        sdk_7_0
        sdk_6_0
      ])
    iwgtk
    keepassxc
    libreoffice-fresh
    nodejs
    omnisharp-roslyn
    podman-compose
    pqrs
    prismlauncher
    rust-analyzer
    rustc
    rustfmt
    steam-run
    virt-manager
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "23.05";
}
