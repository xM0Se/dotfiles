{ pkgs, lib, config, ... }: {

  options = {
    logi-options-plus.enable =
      lib.mkEnableOption "installs logi-options-plus via homebrew";
  };

  config = lib.mkIf config.logi-options-plus.enable {
    homebrew.casks = [
    "logi-options+"
    ];


  };
}
