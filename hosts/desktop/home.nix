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
    gimp
    gnome.eog
    gnome-multi-writer
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
