{...}: {
  programs.fish = {
    enable = true;

    shellInit = ''
      set fish_greeting
    '';

    shellAbbrs = {
      cat = "bat";
      compress = "tar -zcvf";
      df = "duf --theme ansi";
      du = "dust";
      extract = "tar -zxvf";
      gi = "gitui";
      ps = "procs";
      sudo = "doas";
      vi = "nvim";
    };

    functions = {
      doscleanup = "fd . --type f --print0 | xargs -0 dos2unix";
      md = "lowdown -tterm $argv --term-columns 120 --term-hmargin 4 --term-vmargin 1 --term-shortlinks | less -R";
      myip = "curl ifconfig.co";
      ping = "gping $argv -c Cyan";
      skim = "fzf --preview='bat {} --color=always --style=numbers' | xargs -r bat";
      tree = "exa --tree";
      vio = "fzf --preview='bat {} --color=always --style=numbers' | xargs -r nvim";
      weather = "curl wttr.in";
    };
  };

  xdg.configFile = {
    "fish/conf.d/bindigns.fish".source = ./bindings.fish;
    "fish/conf.d/theme.fish".source = ./theme.fish;
    "fish/conf.d/variables.fish".source = ./variables.fish;

    "fish/functions/colors.fish".source = ./functions/colors.fish;
    "fish/functions/dev-session.fish".source = ./functions/dev-session.fish;
    "fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  };
}
