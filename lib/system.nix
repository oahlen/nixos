{
  config,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  # Firmware settings
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel parameters
  boot.kernel.sysctl = {
    "vm.swappiness" = 0;
    "vm.vfs_cache_pressure" = 50;
  };

  # Replace sudo with doas
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["oahlen"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };

  # Limit journald log size
  services.journald.extraConfig = "SystemMaxUse=100M";

  # Set your time zone
  time.timeZone = "Europe/Stockholm";

  # Internationalisation settings
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Global environment variables
  environment.variables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  console = {
    keyMap = "sv-latin1";
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    liberation_ttf
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    noto-fonts-emoji
  ];

  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    firefox
  ];
}
