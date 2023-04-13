{...}: {
  security = {
    sudo.enable = false;

    doas = {
      enable = true;

      extraRules = [
        {
          users = ["wheel"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
