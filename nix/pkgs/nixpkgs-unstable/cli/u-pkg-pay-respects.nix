{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-pay-respects.enable =
      lib.mkEnableOption "installs pay-respects using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-pay-respects.enable {
    environment.systemPackages =
    [
    pkgs.pay-respects
    ];
  };
}
