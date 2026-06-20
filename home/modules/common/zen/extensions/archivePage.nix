{
  lib,
  config,
  programs,
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.archivePage.enable = lib.mkEnableOption "installs archivePage";

  config = lib.mkIf ext.cfg.archivePage.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "{5b22cb75-8e43-4f2a-bb9b-1da0655ae564}" = "archive-page";
    };
  };
}
