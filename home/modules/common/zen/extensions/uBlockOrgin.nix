{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.uBlockOrigin.enable = lib.mkEnableOption "installs uBlockOrigin";

  config = lib.mkIf ext.cfg.uBlockOrigin.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "uBlock0@raymondhill.net" = "ublock-origin";
    };
  };
}
