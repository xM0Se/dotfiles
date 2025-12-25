{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-bat.enable = lib.mkEnableOption "bat, better cat";
  };

  config = lib.mkIf config.u-pkg-bat.enable {
    environment.systemPackages = [pkgs.bat];
  };
}
