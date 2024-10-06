{pkgs, ...}: {
  imports = [
    ../../shared/core
    ../../shared/optional/desktops/sway
    ../../shared/optional/programs/rbw.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    iwgtk
    keepassxc
  ];

  home.stateVersion = "24.05";
}
