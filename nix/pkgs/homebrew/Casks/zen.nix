{ pkgs, lib, config, ... }: {

  options = {
    zen.enable =
      lib.mkEnableOption "installs zen browser via homebrew";
  };

  config = lib.mkIf config.zen.enable {
    homebrew.casks = [
    "zen"
    ];

    
  };
}
