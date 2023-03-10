with import <nixpkgs> {};
  mkShell {
    name = "python";
    packages = [
      nodePackages.pyright
      (python3.withPackages (p:
        with p; [
          # Custom python packages
        ]))
    ];
  }
