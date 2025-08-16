{ pkgs, lib, config, ... }: {   
 
  imports = [
    ./b-cask-zen.nix
    ./b-cask-twingate.nix
    ./b-cask-signal.nix
    ./b-cask-mullvad.nix
    ./b-cask-orcaslicer.nix
    ./b-cask-aerospace.nix
    ./b-cask-minecraft.nix
    ./b-cask-logi-options-plus.nix
  ];

  options = {
    essential-brew-mac-apps.enable =
      lib.mkEnableOption "enables essential-brew-mac-apps";
  };

  config = lib.mkIf config.essential-brew-mac-apps.enable {
    zen.enable =
      lib.mkDefault true;
    twingate.enable =
      lib.mkDefault true;
    signal.enable =
      lib.mkDefault true;
    mullvad.enable =
      lib.mkDefault true;
    orcaslicer.enable =
      lib.mkDefault true;
    aerospace.enable =
      lib.mkDefault true;
    minecraft.enable =
      lib.mkDefault true;
    logi-options-plus.enable =
      lib.mkDefault true;
  };

}
