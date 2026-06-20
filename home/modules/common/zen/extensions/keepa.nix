{
  lib,
  config,
  programs,
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.keepa.enable = lib.mkEnableOption "installs keepa";

  config = lib.mkIf ext.cfg.keepa.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "amptra@keepa.com" = "keepa"; #Keepa - Amazon Price Tracker
    };
  };
}
