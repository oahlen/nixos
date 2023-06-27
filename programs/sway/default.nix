{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./foot.nix
    ./fuzzel.nix
    ./i3status-rust.nix
    ./kanshi.nix
    ./mako.nix
    ./swayidle.nix
    ./swaylock.nix
    ./wl-sunset.nix
  ];

  wayland.windowManager.sway = {
    enable = true;

    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';

    systemd.enable = true;

    wrapperFeatures = {
      base = true;
      gtk = true;
    };

    xwayland = true;

    config = {
      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        size = 11.0;
      };

      input = {
        "type:keyboard" = {
          xkb_layout = "se,us";
          xkb_options = "caps:escape,grp:win_space_toggle";
          repeat_delay = "250";
          repeat_rate = "40";
        };

        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled";
        };
      };

      output = {
        "*" = {
          bg = "~/Pictures/Wallpapers/tree.jpg fit #ffffff";
        };
      };

      startup = [
        {
          command = "${pkgs.mako}/bin/mako";
        }
      ];

      modifier = "Mod4";

      terminal = "${pkgs.foot}/bin/foot";

      menu = "${pkgs.fuzzel}/bin/fuzzel";

      window = {
        border = 1;
        hideEdgeBorders = "smart";

        commands = [
          {
            command = "resize set 1000 600";
            criteria = {
              app_id = "pavucontrol";
            };
          }
        ];
      };

      floating = {
        titlebar = false;

        criteria = [
          {
            app_id = "pavucontrol";
          }
        ];
      };

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        pkgs.lib.mkOptionDefault {
          "${modifier}+Alt+l" = "exec ${pkgs.swaylock}/bin/swaylock -f";
          "Ctrl+Alt+Delete" = "exec ~/.config/scripts/exit.sh";
          "${modifier}+y" = "exec ~/.config/scripts/emoji-picker.sh";
          "${modifier}+Print" = "exec grim ~/Downloads/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+Shift+Print" = "exec slurp | grim -g - ~/Downloads/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+x" = "split none";
          "${modifier}+Tab" = "workspace next";
          "${modifier}+Shift+Tab" = "workspace prev";
        };

      modes = {
        resize = {
          Left = "resize shrink width 32 px";
          Right = "resize grow width 32 px";
          Up = "resize shrink height 32 px";
          Down = "resize grow height 32 px";
          h = "resize shrink width 32 px";
          j = "resize grow height 32 px";
          k = "resize shrink height 32 px";
          l = "resize grow width 32 px";
          Return = "mode default";
          Escape = "mode default";
        };
      };

      colors = {
        focused = {
          border = "#6996e0";
          background = "#6996e0";
          text = "#fafafa";
          indicator = "#5079be";
          childBorder = "#5079be";
        };

        focusedInactive = {
          border = "#8790a0";
          background = "#8790a0";
          text = "#fafafa";
          indicator = "#8790a0";
          childBorder = "#8790a0";
        };

        unfocused = {
          border = "#bac3cb";
          background = "#bac3cb";
          text = "#4b505b";
          indicator = "#bac3cb";
          childBorder = "#bac3cb";
        };
      };

      bars = [
        {
          command = "${pkgs.sway}/bin/swaybar";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
          position = "top";

          fonts = {
            names = ["JetBrainsMono Nerd Font"];
            size = 11.0;
          };

          extraConfig = ''
            position top
            height 24
            workspace_min_width 30
            status_padding 0
            status_edge_padding 0
          '';

          colors = {
            background = "#dde2e7";
            statusline = "#4b505b";
            separator = "#4b505b";

            focusedWorkspace = {
              border = "#6996e0";
              background = "#6996e0";
              text = "#fafafa";
            };

            activeWorkspace = {
              border = "#8790a0";
              background = "#8790a0";
              text = "#fafafa";
            };

            inactiveWorkspace = {
              border = "#bac3cb";
              background = "#bac3cb";
              text = "#4b505b";
            };

            urgentWorkspace = {
              border = "#e17373";
              background = "#e17373";
              text = "#fafafa";
            };

            bindingMode = {
              border = "#bf75d6";
              background = "#bf75d6";
              text = "#fafafa";
            };
          };
        }
      ];
    };

    extraConfig = ''
      # Screen brightness
      bindsym --locked XF86MonBrightnessUp exec brightnessctl set +5%
      bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-

      # Volume control
      bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
      bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
      bindsym --locked XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle

      # Multimedia
      bindsym --locked XF86AudioPlay exec playerctl play
      bindsym --locked XF86AudioPause exec playerctl pause
      bindsym --locked XF86AudioNext exec playerctl next
      bindsym --locked XF86AudioPrev exec playerctl previous

      titlebar_padding 10 2
    '';

    swaynag = {
      enable = true;

      settings = {
        "<config>" = {
          font = "JetBrainsMono Nerd Font 11";
          edge = "bottom";

          border-bottom-size = 0;
          details-border-size = 0;

          message-padding = 8;

          button-border-size = 0;
          button-padding = 6;
          button-margin-right = 6;
          button-dismiss-gap = 0;
        };
        info = {
          text = "5079be";
          background = "eef1f4";
          button-text = "5079be";
          button-background = "eef1f4";
          details-background = "fafafa";
        };
        warning = {
          text = "be7e05";
          background = "eef1f4";
          button-text = "be7e05";
          button-background = "eef1f4";
          details-background = "fafafa";
        };
        error = {
          text = "d05858";
          background = "eef1f4";
          button-text = "d05858";
          button-background = "eef1f4";
          details-background = "fafafa";
        };
      };
    };
  };
}
