{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    floax.enable =
      lib.mkEnableOption "  ";
  };

  config = lib.mkIf config.floax.enable {
    programs.tmux.plugins = with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = omerxx.tmux-floax;
        extraConfig = " ";
      }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'
      #     set -g @continuum-save-interval '60' # minutes
      #   '';
      # }
    ];
  };
}
