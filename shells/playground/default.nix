{
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      hello
      # Add packages to evaluate
    ];
  }
