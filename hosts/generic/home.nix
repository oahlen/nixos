{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../programs
    ../../profiles/sway/home/foot.nix
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

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
