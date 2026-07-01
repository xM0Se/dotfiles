{
  lib,
  config,
  ...
}: {
  options.brew.cask.hammerspoon.enable =
    lib.mkEnableOption "hammerspoon, powerful macOS automation";

  config = lib.mkIf config.brew.cask.hammerspoon.enable {
    homebrew.casks = [
      "hammerspoon"
    ];
  };
}
