{ pkgs, lib, config, ... }: {

  options = {
    orcaslicer.enable =
      lib.mkEnableOption "installs orcaslicer via homebrew";
  };

  config = lib.mkIf config.orcaslicer.enable {
    homebrew.casks = [
    "orcaslicer"
    ];


  };
}
