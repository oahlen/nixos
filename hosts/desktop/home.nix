{pkgs, ...}: {
  imports = [
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
    firefox
    gnome-multi-writer
    keepassxc
    mpv
    nodejs
    podman-compose
    rbw
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
