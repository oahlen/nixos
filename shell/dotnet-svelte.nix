with import <nixpkgs> {};
  mkShell {
    name = "dotnet-svelte-env";
    packages = [
      dotnet-sdk_7
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
    ];
  }
