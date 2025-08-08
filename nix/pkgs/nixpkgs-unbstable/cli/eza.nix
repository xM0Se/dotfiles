{ pkgs, lib, config, ... }: {

  options = {
    eza.enable = 
      lib.mkEnableOption "enables eza";
  };

  config = lib.mkIf config.eza.enable {
    environment.systemPackages =
    [
    pkgs.eza
    ];
  
  };

}
