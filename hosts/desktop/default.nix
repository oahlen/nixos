{
  nixpkgs,
  inputs,
  system,
  username,
  ...
}:
nixpkgs.lib.nixosSystem {
  system = system;

  modules = [
    ./configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      nixpkgs.config.allowUnfree = true;
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ./home.nix;
      home-manager.extraSpecialArgs = {inherit inputs system;};
    }
  ];

  specialArgs = {inherit inputs username;};
}
