{
  lib,
  config,
  ...
}: {
  imports = [
    ./kicad.nix
    ./mullvad-browser.nix
    ./orcaslicer.nix
    ./homerow.nix
    ./kindavim.nix
    ./lulu.nix
    ./beeper.nix
    ./hammerspoon.nix
    ./blackhole.nix
  ];

  options = {
    brew.cask.common.enable =
      lib.mkEnableOption "common casks";
  };

  config = lib.mkIf config.brew.cask.common.enable {
    brew.cask = {
      mullvad-browser.enable =
        lib.mkDefault true;
      orcaslicer.enable =
        lib.mkDefault true;
      homerow.enable =
        lib.mkDefault true;
      kindavim.enable =
        lib.mkDefault true;
      lulu.enable =
        lib.mkDefault true;
      beeper.enable =
        lib.mkDefault true;
      hammerspoon.enable =
        lib.mkDefault true;
      blackhole.enable =
        lib.mkDefault true;
      kicad.enable =
        lib.mkDefault true;
    };
  };
}
