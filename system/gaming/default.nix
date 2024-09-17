{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    gaming.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to enable gaming related options
      '';
    };
  };

  config = lib.mkIf config.gaming.enable {
    services.xserver.videoDrivers = ["amdgpu"];

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    programs.corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };

    programs.gamemode = {
      enable = true;
      settings = {
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };
}
