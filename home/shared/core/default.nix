{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./dconf.nix
    ./direnv.nix
    ./env.nix
    ./fd.nix
    ./fish
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./neovim
    ./ssh.nix
    ./tmux
    ./yazi.nix
  ];

  # Nix options
  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };

  # Common programs
  programs = {
    eza.enable = true;
    fastfetch.enable = true;
    man.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };

  home.packages = with pkgs; [
    bandwhich
    dogdns
    dos2unix
    du-dust
    duf
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
    sd
    tokei
    xsv
  ];
}
