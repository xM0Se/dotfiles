{
  lib,
  config,
  programs,
  ...
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.obsidianWebClipper.enable = lib.mkEnableOption "installs obsidianWebClipper";

  config = lib.mkIf ext.cfg.obsidianWebClipper.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "clipper@obsidian.md" = "web-clipper-obsidian"; #Obsidian Web Clipper
    };
  };
}
