{
  lib,
  config,
  ...
}: {
  options = {
    right-sidebar.enable =
      lib.mkEnableOption "sets the sidebar to the right side";
  };

  config = lib.mkIf config.right-sidebar.enable {
    programs.vscode.profiles.default.userSettings = {
      "workbench.sideBar.location" = "right";
    };
  };
}
