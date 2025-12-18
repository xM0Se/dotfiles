{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-chawan.enable =
      lib.mkEnableOption "installs chawan using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-chawan.enable {
    environment.systemPackages = [
      pkgs.chawan
    ];
  };
}
