{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-hammerspoon.enable =
      lib.mkEnableOption "hammerspoon";
  };

  config = lib.mkIf config.b-cask-hammerspoon.enable {
    homebrew.casks = [
      "hammerspoon"
    ];
  };
}
