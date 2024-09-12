{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../devices
    ./../../system
    ./../../system/network
    ./../../profiles/gnome
  ];

  networking.hostName = "xps15";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-c0f7c1eb-a5fe-499d-b9f5-8dc04118559f" = {
    device = "/dev/disk/by-uuid/c0f7c1eb-a5fe-499d-b9f5-8dc04118559f";
    keyFile = "/crypto_keyfile.bin";
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

  services.thermald.enable = true;

  services.hardware.bolt.enable = true;

  services.fwupd.enable = true;

  services.printing.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };
  programs.dconf.enable = true;

  services.flatpak.enable = true;

  networking.firewall.allowedTCPPorts = [1313];

  users.users.${username} = {
    uid = 1000;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "audio"
      "libvirtd"
      "video"
      "wheel"
    ];
  };

  system.stateVersion = "23.05";
}
