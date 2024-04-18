{...}: {
  imports = [
    ./tailscale.nix
  ];

  networking = {
    useDHCP = false;
    useNetworkd = true;
    wireless.iwd.enable = true;
    firewall.enable = true; # Should be the default
  };

  systemd.network = {
    enable = true;
    networks = {
      "10-wired" = {
        matchConfig.Name = "enp*s*";
        networkConfig.DHCP = "ipv4";
      };
      "20-wireless" = {
        matchConfig.Name = "wlan*";
        networkConfig.DHCP = "ipv4";
      };
    };
    wait-online.anyInterface = true;
  };
}
