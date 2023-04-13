{pkgs, ...}: {
  fonts.fonts = with pkgs; [
    dejavu_fonts
    liberation_ttf
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    noto-fonts-emoji
  ];
}
