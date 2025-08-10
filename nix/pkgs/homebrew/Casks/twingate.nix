{ pkgs, lib, config, ... }: {

  options = {
    twingate.enable =
      lib.mkEnableOption "installs twngate vpn client via homebrew";
  };

  config = lib.mkIf config.twingate.enable {
    homebrew.casks = [
    "twingate"
    ];


  };
}
