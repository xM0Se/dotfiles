{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-mullvad-browser.enable =
      lib.mkEnableOption "mullvad-browser";
  };

  config = lib.mkIf config.b-cask-mullvad-browser.enable {
    homebrew.casks = [
      "mullvad-browser"
    ];
  };
}
