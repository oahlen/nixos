{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.rider
  ];

  home.file = {
    ".ideavimrc".source = ./.ideavimrc;
  };
}
