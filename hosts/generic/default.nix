{
  nixpkgs,
  inputs,
  system,
  ...
}:
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  modules = [
    ./home.nix
  ];

  extraSpecialArgs = {inherit inputs system;};
}
