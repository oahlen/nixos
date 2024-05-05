{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/rbw.nix
  ];

  sway.defaultDisplay = "DP-1";
  sway.adaptiveSync = false;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.packages = with pkgs; [
    bitwarden-desktop
    gnome-multi-writer
    gnome.eog
    gnome-text-editor
    inkscape
    iwgtk
    keepassxc
    pinta
    podman-compose
    prismlauncher
    steam-run
    tutanota-desktop
  ];

  home.stateVersion = "22.11";
}
