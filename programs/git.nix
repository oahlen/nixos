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
      gc = "git commit";
      gp = "git push --origin";
      gs = "git status";
      gtree = "git log --graph --decorate --oneline";
    };
    delta = {
      enable = true;
      options = {
        navigate = "true";
        side-by-side = "true";
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
          focus_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          focus_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          focus_above: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          focus_below: Some(( code: Char('j'), modifiers: ( bits: 0,),)),

          open_help: Some(( code: F(1), modifiers: ( bits: 0,),)),

          move_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          move_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          move_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          move_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),
          popup_up: Some(( code: Char('p'), modifiers: ( bits: 2,),)),
          popup_down: Some(( code: Char('n'), modifiers: ( bits: 2,),)),
          page_up: Some(( code: Char('u'), modifiers: ( bits: 2,),)),
          page_down: Some(( code: Char('d'), modifiers: ( bits: 2,),)),
          home: Some(( code: Char('g'), modifiers: ( bits: 0,),)),
          end: Some(( code: Char('G'), modifiers: ( bits: 1,),)),
          shift_up: Some(( code: Char('K'), modifiers: ( bits: 1,),)),
          shift_down: Some(( code: Char('J'), modifiers: ( bits: 1,),)),

          edit_file: Some(( code: Char('I'), modifiers: ( bits: 1,),)),

          status_reset_item: Some(( code: Char('U'), modifiers: ( bits: 1,),)),

          diff_reset_lines: Some(( code: Char('u'), modifiers: ( bits: 0,),)),
          diff_stage_lines: Some(( code: Char('s'), modifiers: ( bits: 0,),)),

          stashing_save: Some(( code: Char('w'), modifiers: ( bits: 0,),)),
          stashing_toggle_index: Some(( code: Char('m'), modifiers: ( bits: 0,),)),

          stash_open: Some(( code: Char('l'), modifiers: ( bits: 0,),)),

          abort_merge: Some(( code: Char('M'), modifiers: ( bits: 1,),))
      )
    '';
    theme = ''
      (
          selected_tab: Gray,
          command_fg: Gray,
          selection_bg: Rgb(39, 44, 66),
          selection_fg: Reset,
          cmdbar_bg: Rgb(39, 44, 66),
          cmdbar_extra_lines_bg: Rgb(39, 44, 66),
          disabled_fg: DarkGray,
          diff_line_add: Green,
          diff_line_delete: Red,
          diff_file_added: LightGreen,
          diff_file_removed: LightRed,
          diff_file_moved: LightMagenta,
          diff_file_modified: Yellow,
          commit_hash: Magenta,
          commit_time: Cyan,
          commit_author: Green,
          danger_fg: LightRed,
          push_gauge_bg: Blue,
          push_gauge_fg: Black,
          tag_fg: LightYellow,
          branch_fg: LightMagenta
      )
    '';
  };
}
