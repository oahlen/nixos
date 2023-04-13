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
      xfce.mousepad
      xfce.ristretto
    ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.dbus.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

  sound.mediaKeys.enable = true;

  programs.xwayland.enable = true;

  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.file-roller.enable = true;

  services.gvfs.enable = true;

  services.tumbler.enable = true;
}
