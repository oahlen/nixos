{...}: {
  programs.fish = {
    enable = true;

    shellInit = ''
      set fish_greeting
    '';

    shellAbbrs = {
      compress = "tar -zcvf";
      extract = "tar -zxvf";
    };

    shellAliases = {
      cat = "bat";
      df = "duf --theme ansi";
      du = "dust";
      fetch = "fastfetch";
      gi = "gitui";
      lf = "joshuto";
      nix-edit = "tmuxp load -y nixos";
      ping = "gping";
      ps = "procs";
      sudo = "doas";
      vi = "nvim";
    };

    functions = {
      doscleanup = "fd . --type f --print0 | xargs -0 dos2unix";
      md = "lowdown -tterm $argv --term-columns 120 --term-hmargin 4 --term-vmargin 1 --term-shortlinks | less -R";
      myip = "curl ifconfig.co";
      skim = "fzf --preview='bat {} --color=always --style=numbers' | xargs -r bat";
      tree = "exa --tree";
      vio = "fzf --preview='bat {} --color=always --style=numbers' | xargs -r nvim";
      weather = "curl wttr.in";
      zki = "zk edit --interactive";
    };
  };

  xdg.configFile = {
    "fish/conf.d/theme.fish".source = ./theme.fish;

    "fish/functions/colors.fish".source = ./functions/colors.fish;
    "fish/functions/dev-session.fish".source = ./functions/dev-session.fish;
    "fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  };
}
