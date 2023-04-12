{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 900;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 1800;
        # Idle configuration (for Sway 1.7 and lower use dpms instead of power)
        command = "${pkgs.sway-unwrapped}/bin/swaymsg output * dpms off";
        resumeCommand = "${pkgs.sway-unwrapped}/bin/swaymsg output * dpms on";
      }
    ];
  };
}
