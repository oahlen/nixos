{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];

  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
