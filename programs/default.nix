{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./env.nix
    ./fd.nix
    ./fish
    ./foot.nix
    ./fzf.nix
    ./git.nix
    ./idea
    ./jq.nix
    ./neovim
    ./rbw.nix
    ./tmux
    ./ssh.nix
    ./translate-shell.nix
    ./yazi.nix
    ./zathura.nix
  ];

  # Nix options
  nix.gc.automatic = true;

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
