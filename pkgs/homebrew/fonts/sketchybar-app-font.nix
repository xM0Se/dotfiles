{
  lib,
  config,
  ...
}: {
  options = {
    brew.font.sketchybar-app-font.enable =
      lib.mkEnableOption "sketchybar-app-font";
  };

  config = lib.mkIf config.brew.font.sketchybar-app-font.enable {
    homebrew.casks = [
      "font-sketchybar-app-font"
    ];
  };
}
