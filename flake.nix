{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    rust-overlay,
    ...
  } @ inputs: let
    username = "oahlen";
    system = "x86_64-linux";
  in {
    nixosConfigurations.desktop = import ./hosts/desktop {
      inherit self nixpkgs inputs username;
    };

    nixosConfigurations.notebook = import ./hosts/notebook {
      inherit self nixpkgs inputs username;
    };

    nixosConfigurations.xps15 = import ./hosts/xps15 {
      inherit self nixpkgs inputs username;
    };

    devShells.system.rust = let
      overlays = [
        (import rust-overlay)
        (self: super: {
          rustToolchain = let
            rust = super.rust-bin;
          in
            rust.stable.latest.default.override {
              targets = ["x86_64-unknown-linux-musl"];
            };
        })
      ];

      pkgs = import nixpkgs {inherit system overlays;};
    in
      pkgs.mkShell {
        packages = with pkgs; [
          bacon
          cargo-deny
          cargo-edit
          cargo-watch
          openssl
          pkg-config
          rust-analyzer
          rustToolchain
        ];
      };
  };
}
