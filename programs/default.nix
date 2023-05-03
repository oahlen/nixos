{
  nixosConfig,
  pkgs,
  ...
}: let
  hostname = nixosConfig.networking.hostName;
in {
  imports = [
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./fish
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./lf
    ./neovim
    ./scripts
    ./sway
    ./tmux
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

    man.enable = true;

    ssh = {
      enable = true;
      extraConfig = ''
        AddKeysToAgent yes
      '';
    };

    zoxide.enable = true;
  };

  home.packages = with pkgs; [
    alejandra
    bandwhich
    dog
    du-dust
    duf
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
