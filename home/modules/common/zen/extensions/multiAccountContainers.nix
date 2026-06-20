{
  lib,
  config,
  programs,
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.multiAccountContainers.enable = lib.mkEnableOption "installs multiAccountContainers";

  config = lib.mkIf ext.cfg.multiAccountContainers.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "@testpilot-containers" = "multi-account-containers"; #Firefox Multi-Account Containers
    };
  };
}
