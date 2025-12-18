{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-signal.enable =
      lib.mkEnableOption "installs signal via homebrew";
  };

  config = lib.mkIf config.b-cask-signal.enable {
    homebrew.casks = [
      "signal"
    ];
  };
}
