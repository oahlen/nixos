{
  config,
  pkgs,
  ...
}: {
  # Yubikey
  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  environment.systemPackages = with pkgs; [
    yubikey-touch-detector
    yubioath-desktop
  ];
}
