{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-eza.enable = 
      lib.mkEnableOption "enables eza";
  };

  config = lib.mkIf config.u-pkg-eza.enable {
    environment.systemPackages =
    [
    pkgs.eza
    ];
  
  };

}
