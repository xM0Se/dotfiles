{
  lib,
  config,
  ...
}: {
  options = {
    zen-settings.enable =
      lib.mkEnableOption "zen-settings";
  };
  config = lib.mkIf config.zen-settings.enable {
    programs.zen-browser.profiles."default".settings = {
      "zen.workspaces.force-container-workspace" = true; #Switch to workspace where container is set as default when opening container tabs
      "zen.tabs.vertical" = true;
      "zen.tabs.vertical.right-side" = true;
      "zen.tabs.show-newtab-vertical" = false;
      "zen.welcome-screen.seen" = true;
    };
  };
}
