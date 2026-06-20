{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.tampermonkey.enable = lib.mkEnableOption "installs tampermonkey";

  config = lib.mkIf ext.cfg.tampermonkey.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "firefox@tampermonkey.net" = "Tampermonkey"; #Tampermonkey
    };
  };
}
