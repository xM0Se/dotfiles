{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-mullvad.enable =
      lib.mkEnableOption "installs mullvad vpn client via homebrew";
  };

  config = lib.mkIf config.b-cask-mullvad.enable {
    homebrew.casks = [
      "mullvad-vpn"
    ];
  };
}
