{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.kicad.enable =
      lib.mkEnableOption "kicad, open-source PCB design";
  };

  config = lib.mkIf config.brew.cask.kicad.enable {
    homebrew.casks = [
      "kicad"
    ];
  };
}
