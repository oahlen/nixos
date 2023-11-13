{
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    # For GUI based applications
    LD_LIBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
        fontconfig
        libGL
        libxkbcommon
        mono # For certain tools like Microsoft sbom tool
        wayland
        xorg.libICE
        xorg.libSM
        xorg.libX11
        xorg.libXcursor
        xorg.libXi
        xorg.libXrandr
      ];

    buildInputs = with pkgs; [
      (with dotnetCorePackages;
        combinePackages [
          sdk_7_0
          sdk_6_0
        ])
      netcoredbg
      omnisharp-roslyn
      openssl
    ];
  }
