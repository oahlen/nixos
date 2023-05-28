{...}: {
  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
      username = "USERNAME";
      token = "TOKEN";
    };
  };
}
