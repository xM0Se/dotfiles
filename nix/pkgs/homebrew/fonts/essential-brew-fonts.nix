{ pkgs, lib, config, ... }: {

  imports = [
    ./b-font-sketchybar-app-font.nix
    ./b-font-sf-symbols.nix
    ./b-font-font-hack-nerd-font.nix
  ];

  options = {
    essential-brew-mac-apps.enable =
      lib.mkEnableOption "enables essential-brew-mac-apps";
  };

  config = lib.mkIf config.essential-brew-mac-apps.enable {
    b-font-sketchybar-app-font.enable =
      lib.mkDefault true;
    b-font-sf-symbols.enable =
      lib.mkDefault true;
    b-font-font-hack-nerd-font.enable =
      lib.mkDefault true;
  };

}
