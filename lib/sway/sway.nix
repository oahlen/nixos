{
  config,
  pkgs,
  lib,
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
  ];

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
