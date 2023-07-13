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
    firefox
    iwgtk
    keepassxc
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "23.05";
}
