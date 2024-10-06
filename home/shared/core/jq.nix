{...}: {
  programs.jq = {
    enable = true;

    colors = {
      arrays = "0;37";
      false = "0;35";
      null = "1;35";
      numbers = "0;35";
      objects = "0;37";
      strings = "0;36";
      true = "0;35";
    };
  };
}
