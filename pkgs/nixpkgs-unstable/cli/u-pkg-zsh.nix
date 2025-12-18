{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-zsh.enable =
      lib.mkEnableOption "installs zsh using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-zsh.enable {
    environment.systemPackages = [
      pkgs.zsh
    ];
  };
}
