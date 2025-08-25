{ pkgs, lib, config, ... }: {

  imports = [
    ./plugins/floax.nix
  ];

  options = {
    tmuxconf.enable =
      lib.mkEnableOption "enables tmuxconf";
  };

  config = lib.mkIf config.tmuxconf.enable {
    programs.tmux.enable = true;
    floax.enable = 
      lib.mkDefault true;
  };

}
