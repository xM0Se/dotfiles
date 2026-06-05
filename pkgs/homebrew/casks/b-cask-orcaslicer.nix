{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-orcaslicer.enable =
      lib.mkEnableOption "installs orcaslicer via homebrew";
  };

  config = lib.mkIf config.b-cask-orcaslicer.enable {
    homebrew.casks = [
      "orcaslicer"
    ];
  };
}
