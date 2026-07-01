{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.orcaslicer.enable =
      lib.mkEnableOption "orcaslicer, advanced 3D slicer";
  };

  config = lib.mkIf config.brew.cask.orcaslicer.enable {
    homebrew.casks = [
      "orcaslicer"
    ];
  };
}
