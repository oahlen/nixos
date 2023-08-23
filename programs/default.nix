{pkgs, ...}: {
  imports = [
    ./fish
    ./neovim
    ./tmux
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./env.nix
    ./foot.nix
    ./fzf.nix
    ./git.nix
    ./joshuto.nix
    ./jq.nix
    ./rbw.nix
  ];

  programs = {
    atuin = {
      enable = true;
      flags = [
        "--disable-up-arrow"
      ];
    };

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
