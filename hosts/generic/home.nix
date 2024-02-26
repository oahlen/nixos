{
  pkgs,
  username,
  ...
}: {
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

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.packages = with pkgs; [
    awscli2
    nodejs
    podman-compose
    pqrs
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
