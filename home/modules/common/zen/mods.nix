{
  lib,
  config,
  ...
}: {
  options = {
    zen.mods.enable =
      lib.mkEnableOption "zen-mods";
  };
  config = lib.mkIf config.zen.mods.enable {
    programs.zen-browser.profiles."${config.zen.profile}".mods = [
      "cb5efa80-f1e1-43ce-8c0b-fece8462d225" # Container Halo
      "c01d3e22-1cee-45c1-a25e-53c0f180eea8" # Ghost Tabs
      "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      "81fcd6b3-f014-4796-988f-6c3cb3874db8" # Zen Context Menu
    ];
  };
}
