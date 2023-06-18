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
    ./../../lib/sway/sway.nix
    ./../../lib/system.nix
    ./../../lib/yubikey.nix
  ];

  networking.hostName = "xps15";

  # Enable thunderbolt
  services.hardware.bolt.enable = true;

  # Enable printing
  services.printing.enable = true;

  # Virtualisation with libvirt
  virtualisation.libvirtd = {
    enable = true;
    ovmf.enable = true;
  };
  programs.dconf.enable = true;

  # Make chromium run in Wayland mode
  nixpkgs.config = {
    chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice
  ];

  users.users.oahlen = {
    uid = 1000;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "audio"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
    packages = with pkgs; [
      chromium
      dbeaver
      libreoffice-fresh
      pqrs
      quickemu
      virt-manager
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
