{
  nixpkgs,
  inputs,
  system,
  ...
}: let
  overlays = [
    (import inputs.rust-overlay)
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
    buildInputs = with pkgs; [
      bacon
      cargo-deny
      cargo-edit
      cargo-watch
      openssl
      pkg-config
      rust-analyzer
      rustToolchain
    ];
  }
