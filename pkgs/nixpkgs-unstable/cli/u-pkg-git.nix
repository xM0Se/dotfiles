{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-git.enable =
      lib.mkEnableOption "installs git using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-git.enable {
    environment.systemPackages = [
      pkgs.git
    ];
  };
}
