{pkgs, ...}: {
  programs.fuzzel = {
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=11.5";
        terminal = "${pkgs.foot}/bin/foot -e";
        icons-enabled = "no";
        dpi-aware = "no";
        prompt = "> ";

        width = 40;
        horizontal-pad = 16;
        vertical-pad = 12;
        inner-pad = 8;
        line-height = 16;
      };
      colors = {
        background = "161821ff";
        text = "c6c8d1ff";
        match = "e2a478ff";
        selection = "272c42ff";
        selection-text = "d2d4deff";
        selection-match = "e2a478ff";
        border = "6b7089ff";
      };
      border = {
        width = 2;
        radius = 4;
      };
    };
  };
}
