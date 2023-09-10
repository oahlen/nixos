{...}: {
  services.kanshi = {
    enable = true;

    profiles = {
      nomad = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "3840x2400@59.994Hz";
            scale = 2.0;
            position = "0,0";
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

      op-dell-1 = {
        outputs = [
          {
            criteria = "Dell Inc. DELL U3423WE CV9MMP3";
            status = "enable";
            mode = "3440x1440";
            scale = 1.0;
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "1920x1200@59.885Hz";
            position = "3440,0";
          }
        ];
      };

      op-konferensrum = {
        outputs = [
          {
            criteria = "Samsung Electric Company SAMSUNG 0x00000F00";
            status = "enable";
            mode = "3840x2160";
            scale = 2.0;
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "1920x1200@59.885Hz";
            position = "1920,0";
          }
        ];
      };
    };
  };
}
