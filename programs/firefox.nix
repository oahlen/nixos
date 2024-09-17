{...}: {
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "sv-SE"
    ];
  };
}
