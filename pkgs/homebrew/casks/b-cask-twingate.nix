{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-twingate.enable =
      lib.mkEnableOption "installs twngate vpn client via homebrew";
  };

  config = lib.mkIf config.b-cask-twingate.enable {
    homebrew.casks = [
      "twingate"
    ];
  };
}
