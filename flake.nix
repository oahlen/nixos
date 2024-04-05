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
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    username = "oahlen";
  in {
    nixosConfigurations = let
      makeHost = hostname: system:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {inherit inputs username;};

          modules = [
            ./hosts/${hostname}/configuration.nix

            home-manager.nixosModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./hosts/${hostname}/home.nix;
                extraSpecialArgs.inputs = inputs;
              };
            }

            inputs.nixos-wsl.nixosModules.wsl
          ];
        };
    in {
      desktop = makeHost "desktop" "x86_64-linux";
      notebook = makeHost "notebook" "x86_64-linux";
      xps15 = makeHost "xps15" "x86_64-linux";
      nixos = makeHost "wsl" "x86_64-linux";
    };

    # Generic nix + home-manager configuration
    homeConfigurations = let
      makeHost = system:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
          };

          modules = [
            ./generic/home.nix
          ];

          extraSpecialArgs = {inherit inputs system;};
        };
    in {
      debian = makeHost "x86_64-linux";
    };

    devShells = let
      system = "x86_64-linux";
    in {
      system.playground = import ./shells/playground {
        inherit self nixpkgs system;
      };
    };
  };
}
