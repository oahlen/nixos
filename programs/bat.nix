{pkgs, ...}: {
  programs.bat = {
    enable = true;

    config = {
      theme = "iceberg";
    };

    themes = {
      iceberg = {
        src = pkgs.fetchFromGitHub {
          owner = "oahlen";
          repo = "iceberg.tmTheme";
          rev = "1.0.0";
          sha256 = "16lzyg47ddmlc2mixi2q61xpahk9jfrynp30148vkni7vhk4dbzd";
        };
        file = "iceberg.tmTheme";
      };
    };
  };
}
