{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.noScript.enable = lib.mkEnableOption "installs noScript";

  config = lib.mkIf config.zen.extensions.noScript.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "{73a6fe31-595d-460b-a920-fcc0f8843232}" = "noscript"; #NoScript Security Suite
    };
  };
}
