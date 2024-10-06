{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "bitwarden@ahlen.dev";
      base_url = "https://diskstation.magellanic-cloud.ts.net:5443";
      pinentry = pkgs.pinentry-gnome3;
    };
  };
}
