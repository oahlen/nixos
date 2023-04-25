{...}: {
  programs.lf = {
    enable = true;
    settings = {
      drawbox = true;
      hidden = true;
      icons = true;
    };
  };

  xdg.configFile = {
    "lf/colors".source = ./colors;
    "lf/icons".source = ./icons;
  };
}
