{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-pay-respects.enable = lib.mkEnableOption "pay-respects, command correction";
  };

  config = lib.mkIf config.u-pkg-pay-respects.enable {
    environment.systemPackages = [pkgs.pay-respects];
  };
}
