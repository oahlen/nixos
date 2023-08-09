{...}: {
  services.wlsunset = {
    enable = true;
    latitude = "59.85";
    longitude = "17.64";
    systemdTarget = "sway-session.target";
    temperature = {
      day = 5000;
      night = 4000;
    };
  };
}
