{...}: {
  programs.fish = {
    enable = true;
    shellInit = ''
      set fish_greeting
    '';
  };

  xdg.configFile = {
    "fish/conf.d/abbreviations.fish".source = ./../config/fish/conf.d/abbreviations.fish;
    "fish/conf.d/bindigns.fish".source = ./../config/fish/conf.d/bindings.fish;
    "fish/conf.d/theme.fish".source = ./../config/fish/conf.d/theme.fish;
    "fish/conf.d/variables.fish".source = ./../config/fish/conf.d/variables.fish;

    "fish/functions/colors.fish".source = ./../config/fish/functions/colors.fish;
    "fish/functions/dev-session.fish".source = ./../config/fish/functions/dev-session.fish;
    "fish/functions/doscleanup.fish".source = ./../config/fish/functions/doscleanup.fish;
    "fish/functions/fish_prompt.fish".source = ./../config/fish/functions/fish_prompt.fish;
    "fish/functions/md.fish".source = ./../config/fish/functions/md.fish;
    "fish/functions/myip.fish".source = ./../config/fish/functions/myip.fish;
    "fish/functions/ping.fish".source = ./../config/fish/functions/ping.fish;
    "fish/functions/skim.fish".source = ./../config/fish/functions/skim.fish;
    "fish/functions/tree.fish".source = ./../config/fish/functions/tree.fish;
    "fish/functions/vio.fish".source = ./../config/fish/functions/vio.fish;
    "fish/functions/weather.fish".source = ./../config/fish/functions/weather.fish;
  };
}
