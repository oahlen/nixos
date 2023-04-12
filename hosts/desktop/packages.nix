{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    mesa
    radeontop
    vulkan-tools
  ];
}
