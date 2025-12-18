{
  lib,
  config,
  ...
}: {
  options = {
    b-taps-nikitabobko.enable =
      lib.mkEnableOption "test";
  };

  config = lib.mkIf config.b-taps-nikitabobko.enable {
    homebrew = {
      taps = [
        "nikitabobko/tap"
      ];
    };
  };
}
