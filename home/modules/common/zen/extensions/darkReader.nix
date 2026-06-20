{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.darkReader.enable = lib.mkEnableOption "installs darkReader";

  config = lib.mkIf ext.cfg.darkReader.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "addon@darkreader.org" = "darkreader"; #Dark Reader
    };
  };
}
