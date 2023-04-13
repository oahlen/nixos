{nixosConfig, ...}: let
  hostname = nixosConfig.networking.hostName;
in {
  imports = [
    ./fish
    ./neovim
    ./scripts
    ./sway
    ./tmux
    ./bash.nix
    ./bat.nix
    ./bottom.nix
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

  home.packages = with pkgs; [
    alejandra
    bandwhich
    calc
    dog
    dos2unix
    du-dust
    duf
    fd
    figlet
    gping
    hexyl
    hyperfine
    jless
    kmon
    lowdown
    neofetch
    onefetch
    procs
    rage
    ripgrep
    sd
    tokei
    xsv
  ];

  xdg.configFile = {
    "fd/ignore".text = ''
      .cache
      .dotnet
      .git
      .mozilla
    '';
  };
}
