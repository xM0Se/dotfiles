{ pkgs, lib, config, ... }: {

  options = {
    mullvad.enable =
      lib.mkEnableOption "installs mullvad vpn client via homebrew";
  };

  config = lib.mkIf config.mullvad.enable {
    homebrew.casks = [
    "mullvad-vpn"
    ];


  };
}
