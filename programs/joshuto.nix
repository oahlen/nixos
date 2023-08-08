{...}: {
  programs.joshuto = {
    enable = true;
    settings = {
      xdg_open = true;
      xdg_open_fork = true;
      display = {
        show_borders = true;
        show_hidden = true;
        show_icons = true;
      };
    };
  };
}
