{ pkgs, lib, config, ... }: {

  options = {
    aerospace.enable =
      lib.mkEnableOption "installs aerospace i3 like tiling window manager via homebrew";
  };

  config = lib.mkIf config.aerospace.enable {
    homebrew.casks = [
    "aerospace"
    ];


  };
}
