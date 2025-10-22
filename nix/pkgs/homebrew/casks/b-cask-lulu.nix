{ pkgs, lib, config, ... }: {

  options = {
    b-cask-lulu.enable =
      lib.mkEnableOption "installs lulu via homebrew";
  };

  config = lib.mkIf config.b-cask-lulu.enable {
    homebrew.casks = [
    "lulu"
    ];
  };

}
