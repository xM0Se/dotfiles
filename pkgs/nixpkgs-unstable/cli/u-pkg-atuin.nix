{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-atuin.enable = lib.mkEnableOption "atuin, shell history";
  };

  config = lib.mkIf config.u-pkg-atuin.enable {
    environment.systemPackages = [pkgs.atuin];
  };
}
