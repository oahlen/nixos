{...}: {
  xdg.configFile = {
    "scripts/emoji-picker.sh".source = ./emoji-picker.sh;
    "scripts/exit.sh".source = ./exit.sh;
    "scripts/password-picker.sh".source = ./password-picker.sh;
  };
}
