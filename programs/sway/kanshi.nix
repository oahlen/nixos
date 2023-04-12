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
}
