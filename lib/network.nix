{
  config,
  pkgs,
  ...
}: {
  # Networking configuration
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # Tailscale
  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";
  networking.nameservers = ["100.100.100.100" "8.8.8.8" "1.1.1.1"];
  networking.search = ["magellanic-cloud.ts.net"];
}
