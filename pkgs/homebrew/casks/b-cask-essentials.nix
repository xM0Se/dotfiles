{ pkgs, lib, config, ... }: {   
 
  imports = [
    #./b-cask-zen.nix
    ./b-cask-twingate.nix
    ./b-cask-signal.nix
    ./b-cask-mullvad.nix
    ./b-cask-orcaslicer.nix
    ./b-cask-aerospace.nix
    ./b-cask-minecraft.nix
    ./b-cask-logi-options-plus.nix
    ./b-cask-discord.nix
    ./b-cask-homerow.nix
    ./b-cask-kindavim.nix
    ./b-cask-lulu.nix
    ./b-cask-claude.nix
    ./b-cask-affinity.nix
    ];

  options = {
    b-cask-essentials.enable =
      lib.mkEnableOption "enables essential-brew-mac-apps";
  };

  config = lib.mkIf config.b-cask-essentials.enable {
   # b-cask-zen.enable =
    #  lib.mkDefault true;
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
    b-cask-discord.enable =
      lib.mkDefault true;
    b-cask-homerow.enable =
      lib.mkDefault true;
    b-cask-kindavim.enable =
      lib.mkDefault true;
    b-cask-lulu.enable =
      lib.mkDefault true;
    b-cask-claude.enable =
      lib.mkDefault true;
    b-cask-affinity.enable =
      lib.mkDefault true;
  };

}
