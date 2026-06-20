{
  lib,
  config,
  programs,
  ...
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.stylus.enable = lib.mkEnableOption "installs stylus";

  config = lib.mkIf ext.cfg.stylus.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "styl-us"; #Stylus
    };
  };
}
