{
  username,
  config,
  pkgs,
  ...
}: {
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["${username}"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
