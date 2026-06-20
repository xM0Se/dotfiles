{
  lib,
  config,
  ...
}: let
  ext = import ./lib.nix {inherit lib config;};
in {
  options.zen.extensions.multiAccountContainers.enable = lib.mkEnableOption "installs multiAccountContainers";

  config = lib.mkIf config.zen.extensions.multiAccountContainers.enable {
    programs.zen-browser.policies.ExtensionSettings = ext.mkExtensionSettings {
      "@testpilot-containers" = "multi-account-containers"; #Firefox Multi-Account Containers
    };
  };
}
