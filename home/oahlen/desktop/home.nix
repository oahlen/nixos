{pkgs, ...}: {
  imports = [
    ../../shared/core
    ../../shared/optional/desktops/sway
    ../../shared/optional/programs/rbw.nix
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
  programs.mangohud.enable = true;

  home.packages = with pkgs; [
    bitwarden-desktop
    gimp
    inkscape
    iwgtk
    keepassxc
    obsidian
    pinta
    podman-compose
    prismlauncher
    steam-run
    transmission-gtk
    tutanota-desktop
  ];

  home.stateVersion = "22.11";
}
