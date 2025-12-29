{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-gitmux.enable = lib.mkEnableOption "gitmux, git status tmux";
  };

  config = lib.mkIf config.u-pkg-gitmux.enable {
    environment.systemPackages = [pkgs.gitmux];
  };
}
