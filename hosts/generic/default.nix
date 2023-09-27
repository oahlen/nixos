{
  nixpkgs,
  inputs,
  system,
  username,
  ...
}:
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  system = system;
  homeDirectory = "/home/${username}";
  username = username;

  modules = [
    ./home.nix
  ];

  extraSpecialArgs = {inherit username;};
}
