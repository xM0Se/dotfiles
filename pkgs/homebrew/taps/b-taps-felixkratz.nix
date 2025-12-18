{
  lib,
  config,
  ...
}: {
  options = {
    b-taps-felixkratz.enable =
      lib.mkEnableOption "taps into FelixKratz/formulae";
  };

  config = lib.mkIf config.b-taps-felixkratz.enable {
    homebrew.taps = [
      "FelixKratz/formulae"
    ];
  };
}
