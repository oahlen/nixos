{...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      use-xdg-base-directories = true;
    };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
