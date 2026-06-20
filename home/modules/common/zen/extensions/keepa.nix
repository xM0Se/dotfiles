{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.keepa.enable = lib.mkEnableOption "installs keepa";

  config = lib.mkIf config.zen.extensions.keepa.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "amptra@keepa.com" = "keepa"; #Keepa - Amazon Price Tracker
    };
  };
}
