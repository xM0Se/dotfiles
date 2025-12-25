{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-chawan.enable = lib.mkEnableOption "chawan, cli browser";
  };

  config = lib.mkIf config.u-pkg-chawan.enable {
    environment.systemPackages = [pkgs.chawan];
  };
}
