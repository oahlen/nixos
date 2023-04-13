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
    bitwarden
    bitwarden-cli
    firefox
    keepassxc
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
