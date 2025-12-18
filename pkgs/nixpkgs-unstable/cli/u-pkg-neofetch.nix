{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-neofetch.enable =
      lib.mkEnableOption "enables neofetch";
  };

  config = lib.mkIf config.u-pkg-neofetch.enable {
    environment.systemPackages = [
      pkgs.neofetch
    ];
  };
}
