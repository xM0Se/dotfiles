{
  lib,
  config,
  ...
}: {
  options = {
    zen-search.enable =
      lib.mkEnableOption "search";
  };
  config = lib.mkIf config.zen-search.enable {
    programs.zen-browser.profiles."default".search = {
      force = true;
      engines = {
        github = {
          name = "GitHub Search";
          urls = [{template = "https://github.com/search?q={searchTerms}";}];
          definedAliases = ["@gh"];
        };
        nixpkgs = {
          name = "NixPkgs Search";
          urls = [{template = "https://search.nixos.org/packages?query={searchTerms}";}];
          definedAliases = ["@np"];
        };
      };
    };
  };
}
