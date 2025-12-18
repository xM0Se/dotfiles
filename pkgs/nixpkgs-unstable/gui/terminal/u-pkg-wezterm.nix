{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-wezterm.enable =
      lib.mkEnableOption "installs wezterm using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-wezterm.enable {
    environment.systemPackages = [
      pkgs.wezterm
    ];
  };
}
