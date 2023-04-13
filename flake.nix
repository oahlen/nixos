{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    username = "oahlen";
  in {
    nixosConfigurations.desktop = import ./hosts/desktop {
      inherit self nixpkgs inputs username;
    };

    nixosConfigurations.notebook = import ./hosts/notebook {
      inherit self nixpkgs inputs username;
    };
  };
}
