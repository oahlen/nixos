{pkgs, ...}: {
  programs.sway = {
    enable = true;

    extraPackages = with pkgs; [
      brightnessctl
      glib
      gnome3.adwaita-icon-theme
      grim
      libnotify
      pavucontrol
      playerctl
      polkit_gnome
      slurp
      swayimg
      wf-recorder
      wl-clipboard
      wl-mirror
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

  services.dbus = {
    enable = true;
    packages = [pkgs.gcr];
  };

  # Pipewire config
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;

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
