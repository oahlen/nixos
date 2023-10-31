{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "oahlen";
    forAllSystems = nixpkgs.lib.genAttrs [
      system
    ];
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

    nixosConfigurations.nixos = import ./hosts/wsl {
      inherit self nixpkgs inputs system username;
    };

    homeConfigurations."${username}@debian" = import ./hosts/generic {
      inherit self nixpkgs inputs system username;
    };

    devShells = forAllSystems (
      system: {
        dotnet = import ./shells/dotnet {
          inherit self nixpkgs system;
        };
        python = import ./shells/python {
          inherit self nixpkgs system;
        };
        rust = import ./shells/rust {
          inherit self nixpkgs inputs system;
        };
        playground = import ./shells/playground {
          inherit self nixpkgs system;
        };
      }
    );
  };
}
