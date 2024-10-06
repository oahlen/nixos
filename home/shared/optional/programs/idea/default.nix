{config, ...}: {
  home.file = {
    "${config.home.sessionVariables.XDG_CONFIG_HOME}/ideavim/ideavimrc".source = ./.ideavimrc;
  };
}
