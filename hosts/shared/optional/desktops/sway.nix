{pkgs, ...}: {
  imports = [
    ../network
    ../pipewire.nix
  ];

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

  # File management
  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Common GNOME packages including file manager
  environment.systemPackages = with pkgs; [
    gnome.eog
    gnome.gnome-disk-utility
    gnome-multi-writer
    gnome.nautilus
    gnome-text-editor
  ];
}
