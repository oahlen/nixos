{
  pkgs,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        shell = "${lib.getExe pkgs.fish}";

        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=11";
        dpi-aware = "no";

        pad = "10x10";
        initial-window-size-chars = "150x50";
      };

      cursor = {
        style = "beam";
        color = "f8f6f5 4f5e68";
      };

      colors = {
        alpha = "1";

        foreground = "4b505b";
        background = "fafafa";

        selection-foreground = "4b505b";
        selection-background = "e8ebf0";

        regular0 = "dde2e7";
        regular1 = "d05858";
        regular2 = "608e32";
        regular3 = "be7e05";
        regular4 = "5079be";
        regular5 = "b05ccc";
        regular6 = "3a8b84";
        regular7 = "4b505b";

        bright0 = "8790a0";
        bright1 = "d05858";
        bright2 = "608e32";
        bright3 = "be7e05";
        bright4 = "5079be";
        bright5 = "b05ccc";
        bright6 = "3a8b84";
        bright7 = "4b505b";
      };
    };
  };
}
