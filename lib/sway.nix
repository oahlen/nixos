{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
    extraPackages = with pkgs; [
      brightnessctl
      fuzzel
      gammastep
      gnome3.adwaita-icon-theme
      grim
      pavucontrol
      playerctl
      slurp
      swayidle
      swayimg
      swaylock
      wf-recorder
      wl-clipboard
      xfce.mousepad
      xfce.ristretto
    ];
  };

  home-manager.users.oahlen = {
    pkgs,
    lib,
    ...
  }: {
    wayland.windowManager.sway = {
      enable = true;
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
      '';
      systemdIntegration = true;
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
            bg = "~/Pictures/Wallpapers/archlinux.png fit #161821";
          };
        };
        startup = [
          {
            command = "${pkgs.foot}/bin/foot --server";
          }
          {
            command = "${pkgs.mako}/bin/mako";
          }
        ];
        modifier = "Mod4";
        terminal = "${pkgs.foot}/bin/footclient";
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
        keybindings = lib.mkOptionDefault {
          "Mod4+Alt+l" = "exec ${pkgs.swaylock}/bin/swaylock -f";
          "Ctrl+Alt+Delete" = "exec ~/.config/scripts/exit.sh";
          "Mod4+y" = "exec ~/.config/scripts/emoji-picker.sh";
          "Mod4+Print" = "exec grim ~/Downloads/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "Mod4+Shift+Print" = "exec slurp | grim -g - ~/Downloads/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
        };
        floating = {
          titlebar = false;
          criteria = [
            {
              app_id = "pavucontrol";
            }
          ];
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
            childBorder = "#8a8596";
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
            background = "84a0c6";
            button-text = "1e2132";
            button-background = "84a0c6";
            details-background = "c6c8d1";
          };
          warning = {
            text = "1e2132";
            background = "e2a478";
            button-text = "1e2132";
            button-background = "e2a478";
            details-background = "c6c8d1";
          };
          error = {
            text = "1e2132";
            background = "e27878";
            button-text = "1e2132";
            button-background = "e27878";
            details-background = "c6c8d1";
          };
        };
      };
    };

    programs = {
      swaylock.settings = {
        ignore-empty-password = true;
        font = "JetBrainsMono Nerd Font";
        font-size = 24;

        color = "161821";
        scaling = "solid_color";

        indicator-radius = 120;
        indicator-thickness = 20;

        inside-color = "00000000";
        inside-clear-color = "00000000";
        inside-caps-lock-color = "00000000";
        inside-ver-color = "00000000";
        inside-wrong-color = "00000000";

        line-color = "6b7089";
        line-clear-color = "e2a478";
        line-caps-lock-color = "a093c7";
        line-ver-color = "84a0c6";
        line-wrong-color = "e27878";

        ring-color = "00000000";
        ring-clear-color = "e2a478";
        ring-caps-lock-color = "a093c7";
        ring-ver-color = "84a0c6";
        ring-wrong-color = "e27878";

        separator-color = "00000000";

        key-hl-color = "84a0c6";
        bs-hl-color = "e2a478";
        caps-lock-key-hl-color = "84a0c6";
        caps-lock-bs-hl-color = "e2a478";

        text-color = "c6c8d1";
        text-clear-color = "e2a478";
        text-caps-lock-color = "a093c7";
        text-ver-color = "84a0c6";
        text-wrong-color = "e27878";

        layout-bg-color = "00000000";
        layout-border-color = "6b7089";
        layout-text-color = "c6c8d1";
      };

      i3status-rust = {
        enable = true;
        bars = {
          default = {
            icons = "none";
            settings = {
              theme = {
                overrides = {
                  idle_bg = "auto";
                  idle_fg = "#818596";
                  info_bg = "auto";
                  info_fg = "#89b8c2";
                  good_bg = "auto";
                  good_fg = "#b4be82";
                  warning_bg = "auto";
                  warning_fg = "#e2a478";
                  critical_bg = "auto";
                  critical_fg = "#e27878";
                  separator = " ";
                  separator_bg = "auto";
                  separator_fg = "auto";
                };
              };
            };
            blocks = [
              {
                block = "keyboard_layout";
                driver = "sway";
                mappings = {
                  "English (US)" = "US";
                  "Swedish (N/A)" = "SE";
                };
              }
              {
                block = "hueshift";
                hue_shifter = "gammastep";
                min_temp = 2000;
                max_temp = 6500;
                click_temp = 5000;
                step = 500;
              }
              {
                block = "backlight";
                if_command = "test -e /sys/class/backlight/*backlight/";
                minimum = 5;
                maximum = 100;
                step_width = 5;
                cycle = "[100, 50, 5, 50]";
              }
              {
                block = "sound";
                on_click = "pavucontrol";
                headphones_indicator = true;
              }
              {
                block = "net";
                format = "{ip}";
                format_alt = " {ssid} ({signal_strength})";
                interval = 10;
              }
              {
                block = "battery";
                if_command = "test -e /sys/class/power_supply/BAT0";
                hide_missing = true;
                good = 75;
                warning = 50;
                critical = 25;
                interval = 10;
              }
              {
                block = "time";
                interval = 10;
                format = "%Y-%m-%d %R";
                icons_format = " ";
              }
            ];
          };
        };
      };

      foot = {
        enable = true;
        settings = {
          main = {
            shell = "${pkgs.fish}/bin/fish";

            term = "xterm-256color";
            font = "JetBrainsMono Nerd Font:size=11";
            dpi-aware = "no";

            pad = "10x10";
            initial-window-size-chars = "150x50";
          };
          cursor = {
            style = "beam";
          };
          colors = {
            alpha = "1";

            foreground = "c6c8d1";
            background = "161821";

            selection-foreground = "1e2132";
            selection-background = "c6c8d1";

            regular0 = "1e2132";
            regular1 = "e27878";
            regular2 = "b4be82";
            regular3 = "e2a478";
            regular4 = "84a0c6";
            regular5 = "a093c7";
            regular6 = "89b8c2";
            regular7 = "c6c8d1";

            bright0 = "6b7089";
            bright1 = "e98989";
            bright2 = "c0ca8e";
            bright3 = "e9b189";
            bright4 = "91acd1";
            bright5 = "ada0d3";
            bright6 = "95c4ce";
            bright7 = "d2d4de";
          };
        };
      };

      mako = {
        enable = true;
        font = "JetBrainsMono Nerd Font 11";
        anchor = "bottom-right";

        defaultTimeout = 10000;
        ignoreTimeout = true;

        textColor = "#c6c8d1";
        backgroundColor = "#161821";
        borderColor = "#6b7089";
        progressColor = "#84a0c6";

        borderSize = 2;
        borderRadius = 4;
        padding = "12";
      };
    };

    services = {
      swayidle = {
        enable = true;
        events = [
          {
            event = "before-sleep";
            command = "${pkgs.swaylock}/bin/swaylock -f";
          }
        ];
        timeouts = [
          {
            timeout = 900;
            command = "${pkgs.swaylock}/bin/swaylock -f";
          }
          {
            timeout = 1800;
            # Idle configuration (for Sway 1.7 and lower use dpms instead of power)
            command = "${pkgs.sway}/bin/swaymsg output * dpms off";
            resumeCommand = "${pkgs.sway}/bin/swaymsg output * dpms on";
          }
        ];
      };

      kanshi = {
        enable = true;
        profiles = {
          nomad = {
            outputs = [
              {
                criteria = "eDP-1";
                status = "enable";
              }
            ];
          };
          home = {
            outputs = [
              {
                criteria = "eDP-1";
                status = "disable";
              }
              {
                criteria = "LG Electronics LG HDR WQHD 006NTKFGZ397";
                status = "enable";
                mode = "3440x1440";
                position = "0,0";
              }
            ];
          };
          work = {
            outputs = [
              {
                criteria = "eDP-1";
                status = "disable";
              }
              {
                criteria = "Dell Inc. DELL U2722D J965X83";
                status = "enable";
                mode = "2560x1440";
                position = "0,0";
              }
              {
                criteria = "Dell Inc. DELL U2722D JKWBS83";
                status = "enable";
                mode = "2560x1440";
                position = "2560,0";
              }
            ];
          };
        };
      };
    };

    xdg.configFile = {
      "fuzzel/fuzzel.ini".text = ''
        font="JetBrainsMono Nerd Font:size=11"
        terminal=footclient -e
        launch-prefix=swaymsg exec --
        icons-enabled=no
        dpi-aware=no
        prompt="> "

        width=40
        horizontal-pad=16
        vertical-pad=12
        inner-pad=8
        line-height=16

        [colors]
        background=161821ff
        text=c6c8d1ff
        match=e2a478ff
        selection=272c42ff
        selection-text=c6c8d1ff
        selection-match=e2a478ff
        border=6b7089ff

        [border]
        width=2
        radius=4
      '';

      "scripts/emoji-picker.sh".source = ./../config/scripts/emoji-picker.sh;
      "scripts/exit.sh".source = ./../config/scripts/exit.sh;
    };
  };

  # XDG desktop portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.dbus.enable = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
  sound.mediaKeys.enable = true;

  # Xwayland support
  programs.xwayland.enable = true;

  # File manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # File manager services
  programs.file-roller.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
