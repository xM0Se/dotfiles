{ pkgs, lib, config, ... }: {

  options = {
    module1.enable = 
      lib.mkEnableOption "enables module1";
  };

  config = lib.mkIf config.module1.enable {
    environment.systemPackages =
    [
    pkgs.btop
    ];
  
  };

}




