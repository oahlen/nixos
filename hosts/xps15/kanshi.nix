{...}: {
  services.kanshi = {
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
            scale = 1.0;
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
            scale = 1.0;
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
            scale = 1.0;
            position = "1920,0";
          }
        ];
      };

      vega-235 = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "Dell Inc. DELL U2722D 7M65X83";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "Dell Inc. DELL U2722D 1C65X83";
            status = "enable";
            position = "2560,0";
          }
        ];
      };

      vega-206 = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "Dell Inc. DELL U2722D HM65X83";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "Dell Inc. DELL U2722D JB65X83";
            status = "enable";
            position = "2560,0";
          }
        ];
      };
    };
  };
}
