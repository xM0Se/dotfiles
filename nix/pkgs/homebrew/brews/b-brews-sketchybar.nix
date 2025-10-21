{ pkgs, lib, config, ... }:

{
      
  options.b-brews-sketchybar = {
    enable = lib.mkEnableOption "Install sketchybar via Homebrew";
  };


  config = lib.mkIf config.b-brews-sketchybar.enable {
    homebrew.brews = [ "sketchybar" ];
  };
}
