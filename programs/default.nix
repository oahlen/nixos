{nixosConfig, ...}: let
  hostname = nixosConfig.networking.hostName;
in {
  imports = [
    ./neovim
    ./scripts
    ./sway
    ./tmux
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./zathura.nix
  ];

  programs = {
    chromium = {
      enable = hostname == "xps15";
      commandLineArgs = ["--enable-features=UseOzonePlatform" "-ozone-platform=wayland" "--gtk-version=4"];
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    lf = {
      enable = true;
      settings = {
        drawbox = true;
        hidden = true;
        icons = true;
      };
    };

    man.enable = true;

    ssh.enable = true;

    zoxide.enable = true;
  };

  xdg.configFile = {
    "fd/ignore".text = ''
      .cache
      .dotnet
      .git
      .mozilla
    '';
  };
}
