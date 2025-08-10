{ pkgs, lib, config, ... }: {

  options = {
    signal.enable =
      lib.mkEnableOption "installs signal via homebrew";
  };

  config = lib.mkIf config.signal.enable {
    homebrew.casks = [
    "signal"
    ];


  };
}
