{
  lib,
  config,
  ...
}: {
  options = {
    b-brews-sketchybar.enable =
      lib.mkEnableOption "installs sketchybar via homebrew and starts it on startup";
  };

  config = lib.mkIf config.b-brews-sketchybar.enable {
    homebrew = {
      brews = [
        {
          name = "sketchybar";
          start_service = true;
        }
      ];
    };
  };
}
