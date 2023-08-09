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
      hyprpicker
      pavucontrol
      playerctl
      polkit_gnome
      slurp
      swayimg
      swaylock
      wdisplays
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

  programs.dconf.enable = true;
  services.dbus.enable = true;

  # Pipewire config
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  sound.enable = false;

  sound.mediaKeys.enable = true; # Should not be enabled in Gnome, KDE, etc

  # Security settings
  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;

  programs.ssh.startAgent = true;

  # File manager
  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];

  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
