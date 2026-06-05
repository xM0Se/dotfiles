{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-qmk.enable = lib.mkEnableOption "qmk, keyboard programming";
  };

  config = lib.mkIf config.u-pkg-qmk.enable {
    environment.systemPackages = [pkgs.qmk];
  };
}
