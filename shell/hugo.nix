with import <nixpkgs> {};
  mkShell {
    name = "hugo";
    packages = [
      hugo
    ];
  }
