{ pkgs, lib, config, ... }: {

  imports = [
    ./b-font-font-sketchybar-app-font.nix
    ./b-font-sf-symbols.nix
    ./b-font-font-hack-nerd-font.nix
  ];

  options = {
    essential-brew-fonts.enable =
      lib.mkEnableOption "enables essential-brew-fonts";
  };

  config = lib.mkIf config.essential-brew-fonts.enable {
    b-font-font-sketchybar-app-font.enable =
      lib.mkDefault true;
    b-font-sf-symbols.enable =
      lib.mkDefault true;
    b-font-font-hack-nerd-font.enable =
      lib.mkDefault true;
  };

}
