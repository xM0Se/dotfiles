{
  lib,
  config,
  ...
}: {
  options = {
    zen-mods.enable =
      lib.mkEnableOption "mods";
  };
  config = lib.mkIf config.zen-mods.enable {
    programs.zen-browser = {
      profiles."default" = {
        mods = [
          "6f11c932-b992-433e-8c80-56a613cc511e" # Left Close Button
          "cb5efa80-f1e1-43ce-8c0b-fece8462d225" # Container Halo
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          "c01d3e22-1cee-45c1-a25e-53c0f180eea8" # Ghost Tabs
          "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
          "803c7895-b39b-458e-84f8-a521f4d7a064" # Hide Inactive Workspaces
        ];
      };
    };
  };
}
