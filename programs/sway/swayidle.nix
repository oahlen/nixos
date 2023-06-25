{pkgs, ...}: let
  swaylock = "${pkgs.swaylock}/bin/swaylock -f";
in {
  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = swaylock;
      }
    ];

    timeouts = [
      {
        timeout = 900;
        command = swaylock;
      }
      {
        timeout = 1800;
        command = "${pkgs.sway}/bin/swaymsg 'output * power off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * power on'";
      }
    ];
  };
}
