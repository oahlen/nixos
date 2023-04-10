{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
    ./hardware-configuration.nix
    ./../../lib/development.nix
    ./../../lib/home.nix
    ./../../lib/intel.nix
    ./../../lib/network.nix
    ./../../lib/sway.nix
    ./../../lib/system.nix
    ./../../lib/yubikey.nix
  ];

  networking.hostName = "notebook";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    libimobiledevice
  ];

  users.users.oahlen = {
    uid = 1000;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "audio"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
