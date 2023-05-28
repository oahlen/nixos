{...}: {
  programs.bash = {
    enable = true;

    profileExtra = ''
      # If running from tty1 start sway
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec sway
      fi
    '';

    sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";

      ASPNETCORE_ENVIRONMENT = "Development";
      AWS_CONFIG_FILE = "$XDG_CONFIG_HOME/aws/config";
      AWS_SHARED_CREDENTIALS_FILE = "$XDG_CONFIG_HOME/aws/credentials";
      CALCHISTFILE = "$XDG_CACHE_HOME/calc_history";
      CARGO_HOME = "$XDG_DATA_HOME/cargo";
      LESSHISTFILE = "$XDG_DATA_HOME/less/history";
      MANPAGER = "less -R --use-color -Dd+b -Du+G -DP+kb -DS+ky";
      NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
      NUGET_PACKAGES = "$XDG_CACHE_HOME/NuGetPackages";
      OMNISHARPHOME = "$XDG_CONFIG_HOME/omnisharp";
      PGPASSFILE = "$XDG_CONFIG_HOME/pg/pgpass";
      PSQL_HISTORY = "$XDG_DATA_HOME/psql_history";
      _ZO_FZF_OPTS = "$FZF_DEFAULT_OPTS";
    };

    initExtra = ''
      set +o history
      PS1='[\u@\h \W]\$ '
    '';

    shellAliases = {
      ".." = "cd ..";
    };

    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
  };
}
