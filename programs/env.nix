{config, ...}: {
  home.sessionVariables = {
    AWS_CONFIG_FILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/aws/config";
    AWS_SHARED_CREDENTIALS_FILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/aws/credentials";
    CALCHISTFILE = "${config.home.sessionVariables.XDG_CACHE_HOME}/calc_history";
    CARGO_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/cargo";
    LESSHISTFILE = "${config.home.sessionVariables.XDG_DATA_HOME}/less/history";
    MANPAGER = "less -R --use-color -Dd+b -Du+G -DP+kb -DS+ky";
    NUGET_PACKAGES = "${config.home.sessionVariables.XDG_CONFIG_HOME}/NuGetPackages";
    PGPASSFILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/pg/pgpass";
    PSQL_HISTORY = "${config.home.sessionVariables.XDG_DATA_HOME}/psql_history";
    ZK_NOTEBOOK_DIR = "$HOME/notes";
    _ZO_FZF_OPTS = "${config.home.sessionVariables.FZF_DEFAULT_OPTS}";
  };

  home.sessionPath = [
    "$HOME/.dotnet/tools"
    "$XDG_DATA_HOME/cargo/bin"
  ];
}
