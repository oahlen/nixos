{
  description = "My NixOS configuration";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "oahlen";
  in {
    nixosConfigurations.desktop = import ./hosts/desktop {
      inherit self nixpkgs inputs system username;
    };

    nixosConfigurations.notebook = import ./hosts/notebook {
      inherit self nixpkgs inputs system username;
    };

    nixosConfigurations.xps15 = import ./hosts/xps15 {
      inherit self nixpkgs inputs system username;
    };

    # NixOS WSL configuration
    nixosConfigurations.nixos = import ./hosts/wsl {
      inherit self nixpkgs inputs system username;
    };

    # Generic nix + home-manager configuration
    homeConfigurations."${username}@debian" = import ./hosts/generic {
      inherit self nixpkgs inputs system;
    };

    devShells."x86_64-linux".playground = import ./shells/playground {
      inherit self nixpkgs system;
    };
  };
}
