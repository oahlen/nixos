{
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    packages = with pkgs;
      [python311 virtualenv]
      ++ (with pkgs.python311Packages; [pip]);
  }
