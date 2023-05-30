{...}: {
  programs.i3status-rust = {
    enable = true;

    bars = {
      default = {
        icons = "material-nf";

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
            block = "backlight";
            if_command = "test -e /sys/class/backlight/*backlight/";
            minimum = 5;
            maximum = 100;
            step_width = 5;
            cycle = [5 25 50 75 100];
          }
          {
            block = "sound";
            headphones_indicator = true;
            click = [
              {
                button = "left";
                cmd = "pavucontrol";
              }
            ];
          }
          {
            block = "net";
            format = " $icon {$ssid |}$ip";
            missing_format = " NA ";
            interval = 10;
          }
          {
            block = "battery";
            device = "BAT0";
            if_command = "test -e /sys/class/power_supply/BAT0";
            format = " $icon  $percentage ";
            full_format = "";
            missing_format = "";
            good = 75;
            warning = 50;
            critical = 25;
            interval = 10;
          }
          {
            block = "time";
            interval = 10;
            format = " $icon $timestamp.datetime(f:'%Y-%m-%d %R') ";
          }
        ];
      };
    };
  };
}
