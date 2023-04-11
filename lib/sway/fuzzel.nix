{
  config,
  pkgs,
  ...
}: {
  home-manager.users.oahlen.xdg.configFile = {
    "fuzzel/fuzzel.ini".text = ''
      font="JetBrainsMono Nerd Font:size=11"
      terminal=footclient -e
      launch-prefix=swaymsg exec --
      icons-enabled=no
      dpi-aware=no
      prompt="> "

      width=40
      horizontal-pad=16
      vertical-pad=12
      inner-pad=8
      line-height=16

      [colors]
      background=161821ff
      text=c6c8d1ff
      match=e2a478ff
      selection=272c42ff
      selection-text=c6c8d1ff
      selection-match=e2a478ff
      border=6b7089ff

      [border]
      width=2
      radius=4
    '';

    "scripts/emoji-picker.sh".source = ./../../config/scripts/emoji-picker.sh;
    "scripts/exit.sh".source = ./../../config/scripts/exit.sh;
  };
}
