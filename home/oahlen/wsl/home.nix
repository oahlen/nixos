{pkgs, ...}: {
  imports = [
    ../../shared/core
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.packages = with pkgs; [
    # awscli2
    act
    podman-compose
    pqrs
  ];

  programs.git.lfs.enable = true;

  home.sessionVariables = {
    COLORTERM = "truecolor"; # Windows Terminal fix
  };

  home.stateVersion = "23.05";
}
