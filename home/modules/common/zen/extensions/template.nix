{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.pluginTemplate.enable = lib.mkEnableOption "installs pluginTemplate";

  config = lib.mkIf config.zen.extensions.pluginTemplate.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      # Format is as follows
      # "extensionID can be found at about:support" = "pluginId end url of the plugin"; # Display name of plugin in store
      "{<extensionID>}" = "<pluginId>"; #plugin display name
    };
  };
}
