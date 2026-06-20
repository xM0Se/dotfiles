{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.darkReader.enable = lib.mkEnableOption "installs darkReader";

  config = lib.mkIf config.zen.extensions.darkReader.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "addon@darkreader.org" = "darkreader"; #Dark Reader
    };
  };
}
