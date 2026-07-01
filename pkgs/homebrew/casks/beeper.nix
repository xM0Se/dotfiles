{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.beeper.enable =
      lib.mkEnableOption "beeper, universal messaging";
  };

  config = lib.mkIf config.brew.cask.beeper.enable {
    homebrew.casks = [
      "beeper"
    ];
  };
}
