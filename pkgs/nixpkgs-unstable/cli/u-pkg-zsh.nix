{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-zsh.enable = lib.mkEnableOption "zsh, shell";
  };

  config = lib.mkIf config.u-pkg-zsh.enable {
    environment.systemPackages = [pkgs.zsh];
  };
}
