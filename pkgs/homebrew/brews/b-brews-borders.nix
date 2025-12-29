{
  lib,
  config,
  ...
}: {
  options = {
    b-brews-borders.enable = lib.mkEnableOption "borders, window borders darwin";
  };

  config = lib.mkIf config.b-brews-borders.enable {
    homebrew.brews = ["borders"];
  };
}
