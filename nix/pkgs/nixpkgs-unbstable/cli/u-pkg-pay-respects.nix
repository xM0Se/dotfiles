{ pkgs, lib, config, ... }: {

  options = {
    pay-respects.enable =
      lib.mkEnableOption "installs pay-respects using nixpkgs unstable";
  };

  config = lib.mkIf config.pay-respects.enable {
    environment.systemPackages =
    [
    pkgs.pay-respects
    ];
  };
}
