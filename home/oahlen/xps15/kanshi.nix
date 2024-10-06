{...}: {
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "nomad";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
      }
      {
        profile.name = "home";
        profile.outputs = [
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
      }
      {
        profile.name = "op-dell-1";
        profile.outputs = [
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
      }
      {
        profile.name = "op-konferensrum";
        profile.outputs = [
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
      }
    ];
  };
}
