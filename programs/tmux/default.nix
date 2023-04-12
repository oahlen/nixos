{
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;

    shell = "${lib.getExe pkgs.fish}";
    terminal = "tmux-256color";
    prefix = "C-a";
    baseIndex = 1;
    clock24 = true;
    escapeTime = 50;
    mouse = true;

    extraConfig = ''
      :source ${./tmux.conf}
    '';
  };
}
