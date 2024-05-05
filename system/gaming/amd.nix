{
  lib,
  config,
  ...
}: {
  options = {
    gaming.amd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to enable AMD related GPU options
      '';
    };
  };

  config = lib.mkIf config.gaming.amd.enable {
    services.xserver.videoDrivers = ["amdgpu"];
    boot.kernelParams = ["amdgpu.ppfeaturemask=0xffffffff"]; # To enable AMD undervolting
  };
}
