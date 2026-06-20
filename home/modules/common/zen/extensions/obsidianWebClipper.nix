{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.obsidianWebClipper.enable = lib.mkEnableOption "installs obsidianWebClipper";

  config = lib.mkIf config.zen.extensions.obsidianWebClipper.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "clipper@obsidian.md" = "web-clipper-obsidian"; #Obsidian Web Clipper
    };
  };
}
