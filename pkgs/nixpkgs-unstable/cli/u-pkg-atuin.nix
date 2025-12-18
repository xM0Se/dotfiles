{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-atuin.enable =
      lib.mkEnableOption "installs atuin using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-atuin.enable {
    environment.systemPackages = [
      pkgs.atuin
    ];
  };
}
