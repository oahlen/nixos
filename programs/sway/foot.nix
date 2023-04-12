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
      };
      colors = {
        alpha = "1";

        foreground = "c6c8d1";
        background = "161821";

        selection-foreground = "1e2132";
        selection-background = "c6c8d1";

        regular0 = "1e2132";
        regular1 = "e27878";
        regular2 = "b4be82";
        regular3 = "e2a478";
        regular4 = "84a0c6";
        regular5 = "a093c7";
        regular6 = "89b8c2";
        regular7 = "c6c8d1";

        bright0 = "6b7089";
        bright1 = "e98989";
        bright2 = "c0ca8e";
        bright3 = "e9b189";
        bright4 = "91acd1";
        bright5 = "ada0d3";
        bright6 = "95c4ce";
        bright7 = "d2d4de";
      };
    };
  };
}
