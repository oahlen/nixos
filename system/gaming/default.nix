{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./amd.nix
  ];

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
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;

      extraPackages = with pkgs; [
        mangohud
        vulkan-tools
      ];

      extraPackages32 = with pkgs; [mangohud];
    };

    programs.corectrl.enable = true;

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
