{ pkgs, lib, config, ... }: {

  options = {
    b-cask-homerow.enable =
      lib.mkEnableOption "installs homerow via homebrew";
  };

  config = lib.mkIf config.b-cask-homerow.enable {
    homebrew.casks = [
    "homerow"
    ];
  };
}
