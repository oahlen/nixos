{pkgs, ...}: {
  imports = [
    ./neovim
    ./scripts
    ./sway
    ./tmux
    ./wallpapers
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./fish
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./lf.nix
    ./rbw.nix
    ./zathura.nix
  ];

  programs = {
    exa = {
      enable = true;
      enableAliases = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    firefox.enable = true;

    man.enable = true;

    mpv.enable = true;

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };

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
    nil
    onefetch
    procs
    rage
    sd
    tokei
    xsv
    zk
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
