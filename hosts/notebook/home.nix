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
    iwgtk
    keepassxc
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "23.05";
}
