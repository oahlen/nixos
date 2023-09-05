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
            position = "0,0";
          }
        ];
      };

      op-rum-1 = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "Samsung Electric Company SAMSUNG 0x00000F00";
            status = "enable";
            mode = "3840x2160";
            scale = 2.0;
            position = "0,0";
          }
        ];
      };

      op-rum-gul = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "TBD";
            status = "enable";
            mode = "3840x2160";
            scale = 2.0;
            position = "0,0";
          }
        ];
      };
    };
  };
}
