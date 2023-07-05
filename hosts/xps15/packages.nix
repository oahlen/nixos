{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libimobiledevice
  ];
}
