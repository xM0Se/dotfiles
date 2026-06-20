{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.tampermonkey.enable = lib.mkEnableOption "installs tampermonkey";

  config = lib.mkIf config.zen.extensions.tampermonkey.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "firefox@tampermonkey.net" = "Tampermonkey"; #Tampermonkey
    };
  };
}
