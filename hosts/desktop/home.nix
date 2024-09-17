{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
    ../../programs/firefox.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.chromium.enable = true;
  programs.mangohud.enable = true;
  programs.rbw.enable = true;

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
