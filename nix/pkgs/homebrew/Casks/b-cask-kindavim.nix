{ pkgs, lib, config, ... }: {

  options = {
    b-cask-kindavim.enable =
      lib.mkEnableOption "installs kindavim via homebrew";
  };

  config = lib.mkIf config.b-cask-kindavim.enable {
    homebrew.casks = [
    "kindavim"
    ];
  };
}
