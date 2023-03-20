{
  config,
  pkgs,
  ...
}: {
  # File manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.file-roller.enable = true;
  services.gvfs.enable = true;

  # Yubikey
  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  # Tailscale
  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  # Application packages
  environment.systemPackages = with pkgs; [
    bandwhich
    bat
    bitwarden
    bitwarden-cli
    bottom
    calc
    chezmoi
    curl
    delta
    dog
    dos2unix
    du-dust
    duf
    exa
    fd
    figlet
    firefox
    fish
    fzf
    git
    gitui
    gping
    hexyl
    hyperfine
    iwgtk
    jless
    joshuto
    jq
    keepassxc
    kmon
    lowdown
    mpv
    neofetch
    neovim
    onefetch
    oxker
    procs
    rage
    ripgrep
    sd
    tmux
    tokei
    unzip
    wget
    xfce.mousepad
    xfce.ristretto
    xsv
    yubikey-touch-detector
    yubioath-desktop
    zathura
    zip
  ];
}
