{ pkgs, lib, config, ... }: {

  options = {
    b-cask-logi-options-plus.enable =
      lib.mkEnableOption "installs logi-options-plus via homebrew";
  };

  config = lib.mkIf config.b-cask-logi-options-plus.enable {
    homebrew.casks = [
    "logi-options+"
    ];


  };
}
