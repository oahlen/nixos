{pkgs, ...}: let
  swaylock = "${pkgs.swaylock}/bin/swaylock -f";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
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
        command = "${swaymsg} 'output * power off'";
        resumeCommand = "${swaymsg} 'output * power on'";
      }
    ];
  };
}
