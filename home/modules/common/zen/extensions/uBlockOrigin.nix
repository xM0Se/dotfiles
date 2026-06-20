{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.uBlockOrigin.enable = lib.mkEnableOption "installs uBlockOrigin";

  config = lib.mkIf config.zen.extensions.uBlockOrigin.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "uBlock0@raymondhill.net" = "ublock-origin";
    };
  };
}
