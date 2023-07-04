{...}: {
  programs.bottom = {
    enable = true;

    settings = {
      flags = {
        group_processes = true;
        mem_as_value = true;
      };

      colors = {
        table_header_color = "Cyan";
        widget_title_color = "White";
        avg_cpu_color = "Gray";
        cpu_core_colors = ["Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "LightRed" "LightGreen" "LightYellow" "LightBlue" "LightMagenta" "LightCyan"];
        ram_color = "Magenta";
        swap_color = "Yellow";
        rx_color = "Green";
        tx_color = "Cyan";
        border_color = "DarkGray";
        highlighted_border_color = "Blue";
        text_color = "Gray";
        selected_text_color = "Black";
        selected_bg_color = "Blue";
        graph_color = "Gray";
        high_battery_color = "Green";
        medium_battery_color = "Yellow";
        low_battery_color = "Red";
      };

      row = [
        {
          ratio = 30;
          child = [
            {
              type = "cpu";
            }
          ];
        }
        {
          ratio = 40;
          child = [
            {
              ratio = 4;
              type = "proc";
              default = true;
            }
            {
              ratio = 3;
              child = [
                {
                  type = "temp";
                }
                {
                  type = "disk";
                }
              ];
            }
          ];
        }
        {
          ratio = 30;
          child = [
            {
              type = "net";
            }
            {
              type = "mem";
            }
          ];
        }
      ];
    };
  };
}
