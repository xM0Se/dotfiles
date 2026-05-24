{
  lib,
  config,
  ...
}: {
  imports = [
    ./b-cask-twingate.nix
    ./b-cask-mullvad-browser.nix
    ./b-cask-orcaslicer.nix
    ./b-cask-logi-options-plus.nix
    ./b-cask-homerow.nix
    ./b-cask-kindavim.nix
    ./b-cask-lulu.nix
    ./b-cask-affinity.nix
    ./b-cask-beeper.nix
    ./b-cask-hammerspoon.nix
    ./b-cask-blackhole.nix
  ];

  options = {
    b-cask-essentials.enable =
      lib.mkEnableOption "enables essential-brew-mac-apps";
  };

  config = lib.mkIf config.b-cask-essentials.enable {
    b-cask-twingate.enable =
      lib.mkDefault true;
    b-cask-mullvad-browser.enable =
      lib.mkDefault true;
    b-cask-orcaslicer.enable =
      lib.mkDefault true;
    b-cask-logi-options-plus.enable =
      lib.mkDefault true;
    b-cask-homerow.enable =
      lib.mkDefault true;
    b-cask-kindavim.enable =
      lib.mkDefault true;
    b-cask-lulu.enable =
      lib.mkDefault true;
    b-cask-affinity.enable =
      lib.mkDefault true;
    b-cask-beeper.enable =
      lib.mkDefault true;
    b-cask-hammerspoon.enable =
      lib.mkDefault true;
    b-cask-blackhole.enable =
      lib.mkDefault true;
  };
}
