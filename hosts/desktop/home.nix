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
    docker-compose
    # factorio
    firefox
    keepassxc
    mpv
    nodejs
  ];

  home.stateVersion = "22.11";
}
