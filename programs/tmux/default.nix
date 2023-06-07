{
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    tmuxp.enable = true;

    shell = "${lib.getExe pkgs.fish}";
    terminal = "tmux-256color";
    prefix = "C-a";
    baseIndex = 1;
    clock24 = true;
    escapeTime = 50;
    mouse = true;

    extraConfig = builtins.readFile ./tmux.conf;
  };

  xdg.configFile = {
    "tmuxp/dev-session.yaml".source = ./dev-session.yaml;
    "tmuxp/nixos.yaml".source = ./nixos.yaml;
  };
}
