{pkgs, ...}: {
  imports = [
    ../shared
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-connections
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      epiphany
      geary
    ]);

  programs.xwayland.enable = true;
  xdg.portal.enable = true;

  programs.ssh.startAgent = true;
}
