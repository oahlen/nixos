set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -gx ASPNETCORE_ENVIRONMENT Development
set -gx CALCHISTFILE $XDG_CACHE_HOME/calc_history
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx LESSHISTFILE $XDG_DATA_HOME/less/history
set -gx MANPAGER 'less' '-R' '--use-color' '-Dd+b' '-Du+G' '-DP+kb' '-DS+ky'
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages
set -gx OMNISHARPHOME $XDG_CONFIG_HOME/omnisharp
set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
set -gx PSQL_HISTORY $XDG_DATA_HOME/psql_history
set -gx PYENV_ROOT $XDG_DATA_HOME/pyenv 
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
set -gx _ZO_FZF_OPTS $FZF_DEFAULT_OPTS ''
