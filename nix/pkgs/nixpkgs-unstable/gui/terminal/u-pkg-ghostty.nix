{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-ghostty.enable =
      lib.mkEnableOption "installs ghostty using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-ghostty.enable {
    environment.systemPackages =
    [
    pkgs.ghostty-bin
    ];
  };
}
