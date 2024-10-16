{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../shared/core
  ];

  wsl.enable = true;
  wsl.defaultUser = "${username}";

  time.timeZone = "Europe/Stockholm";
  services.timesyncd.enable = true;

  programs.dconf.enable = true; # Needed by home-manager ...

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  programs.singularity = {
    enable = true;
    package = pkgs.apptainer;
    enableSuid = true;
  };

  users.users.${username} = {
    uid = 1000;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "wheel"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
