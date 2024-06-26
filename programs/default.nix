{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./env.nix
    ./fish
    ./foot.nix
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./neovim
    ./tmux
    ./yazi.nix
  ];

  programs = {
    atuin = {
      enable = true;
      flags = [
        "--disable-up-arrow"
      ];
    };

    eza = {
      enable = true;
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

    translate-shell = {
      enable = true;
      settings = {
        hl = "en";
        tl = ["sv"];
      };
    };
  };

  home.packages = with pkgs; [
    bandwhich
    dogdns
    dos2unix
    du-dust
    duf
    fastfetch
    fd
    figlet
    gping
    hexyl
    hyperfine
    jless
    kmon
    lowdown
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
