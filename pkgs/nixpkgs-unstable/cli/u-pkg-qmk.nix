{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-qmk.enable =
      lib.mkEnableOption "installs qmk using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-qmk.enable {
    environment.systemPackages =
    [
    pkgs.qmk
    ];
  };
}
