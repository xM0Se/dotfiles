{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-tmux.enable = lib.mkEnableOption "tmux, terminal multiplexer";
  };

  config = lib.mkIf config.u-pkg-tmux.enable {
    environment.systemPackages = [pkgs.tmux];
  };
}
