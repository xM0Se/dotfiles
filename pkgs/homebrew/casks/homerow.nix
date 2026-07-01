{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.homerow.enable =
      lib.mkEnableOption "homerow, keyboard first macOS navigation";
  };

  config = lib.mkIf config.brew.cask.homerow.enable {
    homebrew.casks = [
      "homerow"
    ];
  };
}
