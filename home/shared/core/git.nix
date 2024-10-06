{...}: {
  programs.git = {
    enable = true;

    userName = "Oscar Ahlén";

    extraConfig = {
      core = {
        editor = "nvim";
        eol = "lf";
        autocrlf = "input";
      };

      init = {
        defaultBranch = "main";
      };
    };

    aliases = {
      c = "commit";
      s = "status";
      sw = "switch";
      br = "branch";
      tree = "log --graph --decorate --oneline";
    };

    delta = {
      enable = true;

      options = {
        navigate = "true";
        side-by-side = "true";
        syntax-theme = "iceberg";
        file-modified-label = "changed:";
        file-style = "cyan";
        file-decoration-style = "brightblack ul";
        hunk-header-style = "line-number syntax";
        hunk-header-decoration-style = "brightblack box";
        hunk-header-file-style = "white";
        hunk-header-line-number-style = "white";
        minus-style = "#ceb0b6 #53343b";
        minus-non-emph-style = "#ceb0b6 #53343b";
        minus-emph-style = "black red";
        minus-empty-line-marker-style = "#ceb0b6 #53343b";
        plus-style = "#c0c5b9 #45493e";
        plus-non-emph-style = "#c0c5b9 #45493e";
        plus-emph-style = "black green";
        plus-empty-line-marker-style = "#c0c5b9 #45493e";
        line-numbers-minus-style = "white #53343b";
        line-numbers-plus-style = "white #45493e";
        line-numbers-zero-style = "brightblack";
        line-numbers-left-style = "brightblack";
        line-numbers-right-style = "brightblack";
      };
    };
  };

  programs.gitui = {
    enable = true;

    keyConfig = ''
      (
          open_help: Some(( code: F(1), modifiers: "")),

          move_left: Some(( code: Char('h'), modifiers: "")),
          move_right: Some(( code: Char('l'), modifiers: "")),
          move_up: Some(( code: Char('k'), modifiers: "")),
          move_down: Some(( code: Char('j'), modifiers: "")),

          popup_up: Some(( code: Char('p'), modifiers: "CONTROL")),
          popup_down: Some(( code: Char('n'), modifiers: "CONTROL")),
          page_up: Some(( code: Char('b'), modifiers: "CONTROL")),
          page_down: Some(( code: Char('f'), modifiers: "CONTROL")),
          home: Some(( code: Char('g'), modifiers: "")),
          end: Some(( code: Char('G'), modifiers: "SHIFT")),
          shift_up: Some(( code: Char('K'), modifiers: "SHIFT")),
          shift_down: Some(( code: Char('J'), modifiers: "SHIFT")),

          edit_file: Some(( code: Char('I'), modifiers: "SHIFT")),

          status_reset_item: Some(( code: Char('U'), modifiers: "SHIFT")),

          diff_reset_lines: Some(( code: Char('u'), modifiers: "")),
          diff_stage_lines: Some(( code: Char('s'), modifiers: "")),

          stashing_save: Some(( code: Char('w'), modifiers: "")),
          stashing_toggle_index: Some(( code: Char('m'), modifiers: "")),

          stash_open: Some(( code: Char('l'), modifiers: "")),

          abort_merge: Some(( code: Char('M'), modifiers: "SHIFT")),
      )
    '';

    theme = ''
      (
          selected_tab: Some("Gray"),
          command_fg: Some("Gray"),
          selection_bg: Some("#272C42"),
          selection_fg: Some("Reset"),
          cmdbar_bg: Some("#272C42"),
          cmdbar_extra_lines_bg: Some("#272C42"),
          disabled_fg: Some("DarkGray"),
          diff_line_add: Some("Green"),
          diff_line_delete: Some("Red"),
          diff_file_added: Some("LightGreen"),
          diff_file_removed: Some("LightRed"),
          diff_file_moved: Some("LightMagenta"),
          diff_file_modified: Some("Yellow"),
          commit_hash: Some("Magenta"),
          commit_time: Some("Cyan"),
          commit_author: Some("Green"),
          danger_fg: Some("LightRed"),
          push_gauge_bg: Some("Blue"),
          push_gauge_fg: Some("Black"),
          tag_fg: Some("LightYellow"),
          branch_fg: Some("LightMagenta")
      )
    '';
  };
}
