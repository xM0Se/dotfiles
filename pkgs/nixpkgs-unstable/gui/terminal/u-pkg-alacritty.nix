{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-alacritty.enable =
      lib.mkEnableOption "installs alacritty using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-alacritty.enable {
    environment.systemPackages = [
      pkgs.alacritty
    ];
  };
}
