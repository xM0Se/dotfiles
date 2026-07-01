{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.mullvad-browser.enable =
      lib.mkEnableOption "mullvad browser, privacy focused browser";
  };

  config = lib.mkIf config.brew.cask.mullvad-browser.enable {
    homebrew.casks = [
      "mullvad-browser"
    ];
  };
}
