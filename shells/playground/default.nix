{
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    NIX_SHELL = "Playground";
    buildInputs = with pkgs; [
      hello
      # Add packages to evaluate
    ];
  }
