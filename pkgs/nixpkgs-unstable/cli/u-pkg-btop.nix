{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-btop.enable = lib.mkEnableOption "btop, system monitor";
  };

  config = lib.mkIf config.u-pkg-btop.enable {
    environment.systemPackages = [pkgs.btop];
  };
}
