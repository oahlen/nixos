{...}: {
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type f --hidden --follow";

    colors = {
      fg = "#c6c8d1";
      bg = "#161821";
      hl = "#e2a478";
      "fg+" = "#d2d4de";
      "bg+" = "#242940";
      "hl+" = "#e9b189";
      header = "#84a0c6";
      info = "#444b71";
      border = "#444b71";
      separator = "#444b71";
      prompt = "#b4be82";
      pointer = "#e2a478";
      marker = "#89b8c2";
      spinner = "#a093c7";
    };
  };
}
