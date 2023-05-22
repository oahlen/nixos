{...}: {
  services.wlsunset = {
    enable = true;
    latitude = "59.85";
    longitude = "17.64";
    systemdTarget = "sway-session.target";
    temperature = {
      day = 6500;
      night = 4500;
    };
  };
}
