{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../shared/core
    ../shared/optional/desktops/sway.nix
    ../shared/optional/network/tailscale.nix
    ../shared/optional/yubikey.nix
  ];

  networking.hostName = "notebook";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {
      enableHybridCodec = true;
    };
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  time.timeZone = "Europe/Stockholm";

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  users.users.${username} = {
    uid = 1000;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "audio"
      "video"
      "wheel"
    ];
  };

  system.stateVersion = "24.05";
}
