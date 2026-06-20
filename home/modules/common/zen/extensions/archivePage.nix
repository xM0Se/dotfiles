{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.archivePage.enable = lib.mkEnableOption "installs archivePage";

  config = lib.mkIf config.zen.extensions.archivePage.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "{5b22cb75-8e43-4f2a-bb9b-1da0655ae564}" = "archive-page";
    };
  };
}
