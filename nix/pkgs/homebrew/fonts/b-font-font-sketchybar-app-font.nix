{ pkgs, lib, config, ... }: {

  options = {
    b-font-font-sketchybar-app-font.enable =
      lib.mkEnableOption "installs font-sketchybar-app-font using homebrew casks";
  };

  config = lib.mkIf config.u-font-font-sketchybar-app-font.enable {
    homebrew.casks = [
      "font-sketchybar-app-font"
    ];
  };

}
