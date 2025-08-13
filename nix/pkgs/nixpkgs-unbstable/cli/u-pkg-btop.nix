{ pkgs, lib, config, ... }: {

  options = {
    btop.enable =
      lib.mkEnableOption "installs btop using nixpkgs unstable";
  };

  config = lib.mkIf config.btop.enable {
    environment.systemPackages =
    [
    pkgs.btop
    ];
  };
}
