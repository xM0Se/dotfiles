{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-just.enable = lib.mkEnableOption "just, save project commands";
  };

  config = lib.mkIf config.u-pkg-just.enable {
    environment.systemPackages = [pkgs.just];
  };
}
