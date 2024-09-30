{
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;

    settings = {
      shell = "${lib.getExe pkgs.fish}";

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 11.5;
      };

      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };

      colors = {
        primary = {
          foreground = "c6c8d1";
          background = "161821";
        };

        selection = {
          text = "c6c8d1";
          background = "272c42";
        };

        normal = {
          black = "#1e2132";
          red = "#e27878";
          green = "#b4be82";
          yellow = "#e2a478";
          blue = "#84a0c6";
          magenta = "#a093c7";
          cyan = "#89b8c2";
          white = "#c6c8d1";
        };

        bright = {
          black = "#6b7089";
          red = "#e98989";
          green = "#c0ca8e";
          yellow = "#e9b189";
          blue = "#91acd1";
          magenta = "#ada0d3";
          cyan = "#95c4ce";
          white = "#d2d4de";
        };
      };
    };
  };
}
