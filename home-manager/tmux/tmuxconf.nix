{
  lib,
  config,
  ...
}: {
  imports = [
    ./plugins/floax.nix
  ];

  options = {
    tmuxconf.enable =
      lib.mkEnableOption "enables tmuxconf";
  };

  config = lib.mkIf config.tmuxconf.enable {
    programs.tmux.enable = true;
    programs.tmux.prefix = "C-t";
    floax.enable =
      lib.mkDefault true;
  };
}
