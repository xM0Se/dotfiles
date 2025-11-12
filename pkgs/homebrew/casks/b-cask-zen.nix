{ pkgs, lib, config, ... }: {

  options = {
    b-cask-zen.enable =
      lib.mkEnableOption "installs zen browser via homebrew";
  };

  config = lib.mkIf config.b-cask-zen.enable {
    #homebrew.casks = [
   # "zen"
   #];

    
  };
}
