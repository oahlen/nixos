{...}: {
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type f --hidden --follow";

    defaultOptions = [
      "--layout=reverse"
      "--height=40%"
    ];

    colors = {
      fg = "#c6c8d1";
      "fg+" = "#d2d4de";
      bg = "#161821";
      "bg+" = "#242940";
      hl = "#e2a478";
      "hl+" = "#e9b189";
      header = "#84a0c6";
      info = "#444b71";
      border = "#444b71";
      separator = "#444b71";
      gutter = "#1e2132";
      prompt = "#b4be82";
      pointer = "#e2a478";
      marker = "#89b8c2";
      spinner = "#a093c7";
      scrollbar = "#84a0c6";
    };
  };
}
