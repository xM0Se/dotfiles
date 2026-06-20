{
  lib,
  config,
  programs,
  ...
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.noScript.enable = lib.mkEnableOption "installs noScript";

  config = lib.mkIf ext.cfg.noScript.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "{73a6fe31-595d-460b-a920-fcc0f8843232}" = "noscript"; #NoScript Security Suite
    };
  };
}
