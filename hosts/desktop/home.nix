{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/rbw.nix
  ];

  sway.defaultDisplay = "DP-1";
  sway.adaptiveSync = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.packages = with pkgs; [
    gnome-multi-writer
    inkscape
    iwgtk
    keepassxc
    pinta
    podman-compose
    prismlauncher
    steam-run
    tutanota-desktop
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
