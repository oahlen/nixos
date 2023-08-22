{pkgs, ...}: {
  imports = [
    ../../profiles/sway/home
    ../../programs
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  mpv.enable = true;

  home.packages = with pkgs; [
    # factorio
    cargo
    (with dotnetCorePackages;
      combinePackages [
        sdk_7_0
        sdk_6_0
      ])
    gnome-multi-writer
    iwgtk
    keepassxc
    nodejs
    omnisharp-roslyn
    pinta
    podman-compose
    prismlauncher
    rust-analyzer
    rustc
    rustfmt
    xfce.mousepad
    xfce.ristretto
  ];

  home.stateVersion = "22.11";
}
