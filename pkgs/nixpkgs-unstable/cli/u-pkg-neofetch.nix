{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-neofetch.enable = lib.mkEnableOption "neofetch, system information display";
  };

  config = lib.mkIf config.u-pkg-neofetch.enable {
    environment.systemPackages = [pkgs.neofetch];
  };
}
