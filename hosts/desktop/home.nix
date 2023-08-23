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
    gnome-multi-writer
    iwgtk
    keepassxc
    pinta
    podman-compose
    prismlauncher
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
