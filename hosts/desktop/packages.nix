{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mesa
    radeontop
    vulkan-tools
  ];
}
