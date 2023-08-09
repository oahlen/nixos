{
  description = "A Nix-flake-based Dotnet development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (with dotnetCorePackages;
            combinePackages [
              sdk_7_0
              sdk_6_0
            ])
          omnisharp-roslyn
        ];

        shellHook = ''
          Using dotnet version:
          ${pkgs.dotnet-sdk_7}/bin/dotnet --version
        '';
      };
    });
}
