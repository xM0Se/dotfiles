{
  programs,
  config,
  ...
}: let
  cfg = config.zen.extensions;
  extensions = programs.zen-browser.policies.ExtensionSettings;

  mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
    install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
    installation_mode = "force_installed";
  });
in {
  inherit extensions mkExtensionSettings cfg;
}
