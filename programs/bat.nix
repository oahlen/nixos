{pkgs, ...}: {
  programs.bat = {
    enable = true;

    config = {
      theme = "iceberg";
    };

    themes = {
      # nix-prefetch-url --unpack https://github.com/oahlen/iceberg.tmTheme/archive/1.0.0.tar.gz
      iceberg = builtins.readFile (pkgs.fetchFromGitHub {
          owner = "oahlen";
          repo = "iceberg.tmTheme";
          rev = "1.0.0";
          sha256 = "16lzyg47ddmlc2mixi2q61xpahk9jfrynp30148vkni7vhk4dbzd";
        }
        + "/iceberg.tmTheme");
    };
  };
}
