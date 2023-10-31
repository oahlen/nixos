{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../../misc/wallpapers
    ./scripts
    ./dconf.nix
    ./foot.nix
    ./fuzzel.nix
    ./i3status-rust.nix
    ./mako.nix
    ./swayidle.nix
    ./swaylock.nix
    ./wl-sunset.nix
    ./zathura.nix
  ];

  programs.bash = {
    enable = true;

    profileExtra = ''
      # If running from tty1 start sway
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec sway
      fi
    '';
  };

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
          bg = "~/Pictures/Wallpapers/nixos.png fit #161821";
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
        titlebar = false;

        commands = [
          {
            command = "resize set 1000 600";
            criteria = {
              app_id = "pavucontrol";
            };
          }
          {
            command = "resize set 1000 600";
            criteria = {
              app_id = "iwgtk";
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
          {
            app_id = "iwgtk";
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
          "${modifier}+p" = "exec ~/.config/scripts/password-picker.sh";
          "Print" = "exec ${pkgs.grim}/bin/grim ~/Pictures/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+Print" = "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - ~/Pictures/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+Shift+Print" = "exec ${pkgs.hyprpicker}/bin/hyprpicker | ${pkgs.wl-clipboard}/bin/wl-copy";
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
          border = "#84a0c6";
          background = "#84a0c6";
          text = "#1e2132";
          indicator = "#91acd1";
          childBorder = "#84a0c6";
        };

        focusedInactive = {
          border = "#818596";
          background = "#818596";
          text = "#1e2132";
          indicator = "#9a9ca5";
          childBorder = "#818596";
        };

        unfocused = {
          border = "#1e2132";
          background = "#1e2132";
          text = "#6b7089";
          indicator = "#272c42";
          childBorder = "#1e2132";
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
            background = "#0f1117";
            statusline = "#818596";
            separator = "#818596";

            focusedWorkspace = {
              border = "#84a0c6";
              background = "#84a0c6";
              text = "#1e2132";
            };

            activeWorkspace = {
              border = "#818596";
              background = "#818596";
              text = "#1e2132";
            };

            inactiveWorkspace = {
              border = "#1e2132";
              background = "#1e2132";
              text = "#6b7089";
            };

            urgentWorkspace = {
              border = "#e27878";
              background = "#e27878";
              text = "#1e2132";
            };

            bindingMode = {
              border = "#e2a478";
              background = "#e2a478";
              text = "#1e2132";
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
          text = "1e2132";
          background = "#91acd1";
          button-text = "1e2132";
          button-background = "84a0c6";
          details-background = "84a0c6";
        };
        warning = {
          text = "1e2132";
          background = "e9b189";
          button-text = "1e2132";
          button-background = "e2a478";
          details-background = "e2a478";
        };
        error = {
          text = "1e2132";
          background = "e98989";
          button-text = "1e2132";
          button-background = "e27878";
          details-background = "e27878";
        };
      };
    };
  };
}
