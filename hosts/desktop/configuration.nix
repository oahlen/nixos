{
  username,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./../../devices
    ./../../system
  ];

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  time.timeZone = "Europe/Stockholm";

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  services.journald.extraConfig = "SystemMaxUse=100M";

  virtualisation.docker.enable = true;

  users.users.${username} = {
    uid = 1000;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  system.stateVersion = "22.11";
}
