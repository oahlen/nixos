{
  config,
  pkgs,
  ...
}: {
  # Docker virtualisation
  virtualisation.docker.enable = true;
  users.users.oahlen.extraGroups = ["docker"];

  # Development packages and SDKs
  users.users.oahlen.packages = with pkgs; [
    alejandra
    docker-compose
    nodejs
    sumneko-lua-language-server
  ];
}
