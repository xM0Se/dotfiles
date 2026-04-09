{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-blackhole.enable =
      lib.mkEnableOption "blackhole";
  };

  config = lib.mkIf config.b-cask-blackhole.enable {
    homebrew.casks = [
      "blackhole-2ch"
    ];
  };
}
