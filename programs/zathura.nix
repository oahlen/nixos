{...}: {
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
      font = "JetBrainsMono Nerd Font normal 11";

      recolor-lightcolor = "#fafafa";
      recolor-darkcolor = "#4b505b";
      recolor-keephue = true;
      default-bg = "#fafafa";

      statusbar-bg = "#e8ebf0";
      statusbar-fg = "#4b504b";
      inputbar-bg = "#fafafa";
      inputbar-fg = "#4b505b";

      notification-error-bg = "#d05858";
      notification-error-fg = "#fafafa";
      notification-warning-bg = "#be7e05";
      notification-warning-fg = "#fafafa";
      notification-bg = "#5079be";
      notification-fg = "#fafafa";

      highlight-color = "#608e32";
      highlight-active-color = "#5079be";
      highlight-transparency = "0.5";

      completion-bg = "#e8ebf0";
      completion-fg = "#4b505b";
      completion-group-bg = "#bac3cb";
      completion-group-fg = "#4b504b";
      completion-highlight-bg = "#6996e9";
      completion-highlight-fg = "#fafafa";
    };
  };
}
