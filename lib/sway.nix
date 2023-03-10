{
  config,
  pkgs,
  ...
}: {
  # Sway window manager
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export MOZ_ENABLE_WAYLAND=1
    '';
    extraPackages = with pkgs; [
      brightnessctl
      foot
      fuzzel
      gammastep
      gnome3.adwaita-icon-theme
      grim
      i3status-rust
      kanshi
      mako
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

  # XDG desktop portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.dbus.enable = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
  sound.mediaKeys.enable = true;

  # Xwayland support
  programs.xwayland.enable = true;
}
