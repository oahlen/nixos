{...}: {
  programs.i3status-rust = {
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
            cycle = [100 50 5 50];
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
}
