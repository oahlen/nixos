{pkgs, ...}: {
  programs.sway = {
    enable = true;

    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';

    extraPackages = with pkgs; [
      brightnessctl
      glib
      gnome3.adwaita-icon-theme
      grim
      pavucontrol
      playerctl
      slurp
      swayimg
      swaylock
      wf-recorder
      wl-clipboard
      xdg-utils
    ];
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services.dbus.enable = true;

  services.gnome.gnome-keyring.enable = true;
  programs.ssh.startAgent = true;

  sound.mediaKeys.enable = true; # Should not be enabled in Gnome, KDE, etc
}
