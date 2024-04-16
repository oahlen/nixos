{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/rbw.nix
  ];

  sway.defaultDisplay = "DP-1";

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.firefox.enable = true;
  programs.chromium.enable = true;

  home.packages = with pkgs; [
    gnome-multi-writer
    inkscape
    iwgtk
    keepassxc
    pinta
    podman-compose
    prismlauncher
    steam-run
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
