{pkgs, ...}: {
  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs; [
    gnome.dconf-editor
    gnome.gnome-tweaks
  ];
}
