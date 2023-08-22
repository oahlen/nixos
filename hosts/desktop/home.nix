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

  home.packages = with pkgs; [
    # factorio
    (with dotnetCorePackages;
      combinePackages [
        sdk_7_0
        sdk_6_0
      ])
    gnome-multi-writer
    iwgtk
    keepassxc
    nodejs
    omnisharp-roslyn
    pinta
    podman-compose
    prismlauncher
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
