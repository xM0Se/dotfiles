{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-fzf.enable =
      lib.mkEnableOption "enables fzf";
  };

  config = lib.mkIf config.u-pkg-fzf.enable {
    environment.systemPackages = [
      pkgs.fzf
    ];
  };
}
