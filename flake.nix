{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = let
      makeHost = hostname: username: system:
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
                users.${username} = import ./home/${username}/${hostname}/home.nix;
                extraSpecialArgs.inputs = inputs;
              };
            }

            inputs.nixos-wsl.nixosModules.wsl
          ];
        };
    in {
      desktop = makeHost "desktop" "oahlen" "x86_64-linux";
      notebook = makeHost "notebook" "oahlen" "x86_64-linux";
      xps15 = makeHost "xps15" "oahlen" "x86_64-linux";
      nixos = makeHost "wsl" "oahlen" "x86_64-linux";
    };

    # Generic nix + home-manager configuration
    homeConfigurations = let
      makeHost = hostname: username: system:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
          };

          modules = [
            ./home/${username}/${hostname}/home.nix
          ];

          extraSpecialArgs = {inherit inputs system;};
        };
    in {
      debian = makeHost "generic" "oahlen" "x86_64-linux";
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
