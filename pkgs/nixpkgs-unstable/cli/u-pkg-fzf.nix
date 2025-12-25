{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-fzf.enable = lib.mkEnableOption "fzf, fuzzy finder";
  };

  config = lib.mkIf config.u-pkg-fzf.enable {
    environment.systemPackages = [pkgs.fzf];
  };
}
