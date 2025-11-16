{ pkgs, lib, config, ... }: {

  options = {
    b-cask-affinity.enable =
      lib.mkEnableOption "installs affinity via homebrew";
  };

  config = lib.mkIf config.b-cask-affinity.enable {
    homebrew.casks = [
    "affinity"
    ];


  };
}
