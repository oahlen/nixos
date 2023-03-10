{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./neovim.nix
  ];

  home-manager.users.oahlen = {
    home.username = "oahlen";
    home.homeDirectory = "/home/oahlen";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";

    # Enable XDG user directories
    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };

    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
      '';
    };

    programs.zoxide.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    "bat/themes/iceberg.tmTheme" = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/oahlen/iceberg.tmTheme/1.0.0/iceberg.tmTheme";
      };
    };
  };
}
