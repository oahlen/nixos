{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../programs
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.packages = with pkgs; [
    alejandra
    bandwhich
    bitwarden
    bitwarden-cli
    calc
    docker-compose
    dog
    dos2unix
    du-dust
    duf
    # factorio
    fd
    figlet
    firefox
    gping
    hexyl
    hyperfine
    jless
    keepassxc
    kmon
    lowdown
    mpv
    neofetch
    nodejs
    onefetch
    procs
    rage
    ripgrep
    sd
    sumneko-lua-language-server
    tokei
    unzip
    wget
    xsv
    zip
  ];

  home.stateVersion = "22.11";
}
