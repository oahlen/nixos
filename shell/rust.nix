with import <nixpkgs> {};
  mkShell {
    name = "rust";
    packages = [
      bacon
      rust-analyzer
      rustup
    ];
  }
