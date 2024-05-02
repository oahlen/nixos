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
    ./../../profiles/sway
  ];

  networking.hostName = "desktop";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
      vaapiVdpau
    ];
  };

  time.timeZone = "Europe/Stockholm";

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  services.flatpak.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  gaming = {
    enable = true;
    amd.enable = true;
  };
  programs.steam.enable = true;

  programs.firefox.enable = true;
  programs.chromium.enable = true;

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

  system.stateVersion = "22.11";
}
