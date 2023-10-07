{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mangohud
    mesa
    radeontop
    vulkan-tools
  ];
}
