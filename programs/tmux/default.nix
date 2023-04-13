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
      # 256 color support
      set -ga terminal-overrides ",xterm-256color:Tc"

      # hjkl pane traversal
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Set window split
      bind v split-window -h
      bind b split-window

      # Global alt keys
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -n M-c new-window
      bind -n M-n select-window -n
      bind -n M-L select-window -n
      bind -n M-p select-window -p
      bind -n M-H select-window -p
      bind -n M-v split-window -h
      bind -n M-b split-window

      # Enable clipboard
      set -g set-clipboard on

      # Vi copypaste mode
      set-window-option -g mode-keys vi
      bind-key -Tcopy-mode-vi 'C-v' send -X begin-selection
      bind-key -Tcopy-mode-vi 'C-y' send -X copy-selection

      # Focus events
      set-option -g focus-events on

      # Reload of config
      bind r source ~/.config/tmux/tmux.conf\; display "tmux config reloaded"

      # Styling
      set -g message-style fg=white,bg=default
      set -g message-command-style fg=black,bg=blue

      set -g mode-style fg=black,bg=white

      set-option -g pane-border-style fg=brightblack
      set-option -g pane-active-border-style fg=blue

      set-window-option -g clock-mode-colour cyan

      # Status bar
      set -g status-position bottom
      set -g status-style fg=default,bg=default
      set -g status-justify absolute-centre

      set-window-option -g window-status-style fg=white,bg=default
      set-window-option -g window-status-format "#[fg=blue]#I#[fg=cyan]#F #[fg=default]#W"

      set-window-option -g window-status-current-style fg=default,bg=default,bold
      set-window-option -g window-status-current-format "#[fg=brightblue]#I#[fg=brightcyan]#F #[fg=default,underscore]#W"

      set-window-option -g window-status-separator "  "
      set-window-option -g automatic-rename

      set -g status-left-style fg=default,bold
      set -g status-left "#[fg=cyan]Session: #[fg=default]#S "
      set -g status-left-length 100

      set -g status-right "#[fg=blue,bold]#(whoami)#[fg=default]@#[fg=cyan,bold]#H #[fg=white,nobold]in #[fg=blue,bold]#T "
      set -g status-right-length 200
    '';
  };
}
