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
      fuzzel
      gammastep
      gnome3.adwaita-icon-theme
      grim
      pavucontrol
      playerctl
      slurp
      swayidle
      swayimg
      swaylock
      wf-recorder
      wl-clipboard
    ];
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.dbus.enable = true;

  programs.ssh.startAgent = true;

  sound.mediaKeys.enable = true; # Should not be enabled in Gnome, KDE, etc
}
