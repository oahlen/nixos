{...}: {
  imports = [
    ../../../misc/wallpapers
  ];

  programs.fuzzel.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      delay = 250;
      repeat-interval = 40;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
    };
  };
}
