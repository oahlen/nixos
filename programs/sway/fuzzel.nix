{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=11";
        terminal = "${pkgs.foot}/bin/foot -e";
        launch-prefix = "swaymsg exec --";
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
        background = "e8ebf0ff";
        text = "4b505bff";
        match = "5079beff";
        selection = "6996e0ff";
        selection-text = "fafafaff";
        selection-match = "fafafaff";
        border = "8790a0ff";
      };
      border = {
        width = 2;
        radius = 4;
      };
    };
  };
}
