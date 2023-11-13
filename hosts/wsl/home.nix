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
    awscli2
    dotnet-sdk_7
    nodejs
    podman-compose
    pqrs
  ];

  home.stateVersion = "23.05";
}