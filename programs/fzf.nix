{...}: {
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type f --hidden --follow";

    defaultOptions = [
      "--layout=reverse"
      "--height=40%"
      "--scrollbar '▌'"
    ];

    colors = {
      fg = "#4b505b";
      "fg+" = "#4b505b";
      bg = "#fafafa";
      "bg+" = "#e3eaf6";
      hl = "#5079be";
      "hl+" = "#5079be";
      header = "#5079be";
      info = "#8790a0";
      border = "#8790a0";
      separator = "#8790a0";
      gutter = "#eef1f4";
      prompt = "#608e32";
      pointer = "#be7e05";
      marker = "#3a8b84";
      spinner = "#b05ccc";
      scrollbar = "#5079be";
    };
  };
}
