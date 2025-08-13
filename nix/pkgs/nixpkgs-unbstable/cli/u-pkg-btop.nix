{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-btop.enable =
      lib.mkEnableOption "installs btop using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-btop.enable {
    environment.systemPackages =
    [
    pkgs.btop
    ];
  };
}
