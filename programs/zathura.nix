{...}: {
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
      font = "JetBrainsMono Nerd Font normal 11.5";

      recolor-lightcolor = "#161821";
      recolor-darkcolor = "#c6c8d1";
      recolor-keephue = true;
      default-bg = "#161821";

      statusbar-bg = "#0f1117";
      statusbar-fg = "#c6c8d1";
      inputbar-bg = "#161821";
      inputbar-fg = "#c6c8d1";

      notification-error-bg = "#e27878";
      notification-error-fg = "#1e2132";
      notification-warning-bg = "#e2a478";
      notification-warning-fg = "#1e2132";
      notification-bg = "#84a0c6";
      notification-fg = "#1e2132";

      highlight-color = "#e2a478";
      highlight-active-color = "#b4be82";
      highlight-transparency = "0.5";

      completion-bg = "#3d425b";
      completion-fg = "#c6c8d1";
      completion-group-bg = "#0f1117";
      completion-group-fg = "#818596";
      completion-highlight-bg = "#5b6389";
      completion-highlight-fg = "#eff0f4";
    };
  };
}
