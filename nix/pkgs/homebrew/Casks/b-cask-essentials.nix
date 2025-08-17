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
    b-cask-zen.enable =
      lib.mkDefault true;
    b-cask-twingate.enable =
      lib.mkDefault true;
    b-cask-signal.enable =
      lib.mkDefault true;
    b-cask-mullvad.enable =
      lib.mkDefault true;
    b-cask-orcaslicer.enable =
      lib.mkDefault true;
    b-cask-aerospace.enable =
      lib.mkDefault true;
    b-cask-minecraft.enable =
      lib.mkDefault true;
    b-cask-logi-options-plus.enable =
      lib.mkDefault true;
  };

}
