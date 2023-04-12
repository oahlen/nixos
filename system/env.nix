{
  config,
  pkgs,
  ...
}: {
  environment.variables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };
}
