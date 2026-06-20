{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.stylus.enable = lib.mkEnableOption "installs stylus";

  config = lib.mkIf config.zen.extensions.stylus.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "styl-us"; #Stylus
    };
  };
}
