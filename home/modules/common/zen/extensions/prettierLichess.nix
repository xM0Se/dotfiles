{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.prettierLichess.enable = lib.mkEnableOption "installs prettierLichess";

  config = lib.mkIf ext.cfg.prettierLichess.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "{8ad4bea8-ad8d-4e98-b434-a76065dee6cb}" = "prettier-lichess"; #Prettier Lichess
    };
  };
}
