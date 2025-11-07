{ pkgs, lib, config, ... }: {

  options = {
    b-cask-aerospace.enable =
      lib.mkEnableOption "installs aerospace i3 like tiling window manager via homebrew";
  };

  config = lib.mkIf config.b-cask-aerospace.enable {
    homebrew.casks = [
    "aerospace"
    ];


  };
}
