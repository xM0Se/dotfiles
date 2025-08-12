{ pkgs, lib, config, ... }: {

  options = {
    fzf.enable =
      lib.mkEnableOption "enables fzf";
  };

  config = lib.mkIf config.fzf.enable {
    environment.systemPackages =
    [
    pkgs.fzf
    ];

  };

}
