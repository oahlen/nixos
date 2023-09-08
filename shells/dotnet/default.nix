{
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    packages = with pkgs; [
      (with dotnetCorePackages;
        combinePackages [
          sdk_7_0
          sdk_6_0
        ])
      netcoredbg
      omnisharp-roslyn
    ];
  }
