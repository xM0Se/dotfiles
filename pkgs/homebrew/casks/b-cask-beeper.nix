{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-beeper.enable = lib.mkEnableOption "beeper, universal messaging";
  };

  config = lib.mkIf config.b-cask-beeper.enable {
    homebrew.casks = ["beeper"];
  };
}
