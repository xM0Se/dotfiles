{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-zoxide.enable =
      lib.mkEnableOption "installs zoxide using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-zoxide.enable {
    environment.systemPackages = [
      pkgs.zoxide
    ];
  };
}
