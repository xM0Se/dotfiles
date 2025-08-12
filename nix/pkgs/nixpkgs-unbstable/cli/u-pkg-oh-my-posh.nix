{ pkgs, lib, config, ... }: {

  options = {
    oh-my-posh.enable = 
      lib.mkEnableOption "enables oh-my-posh";
  };

  config = lib.mkIf config.oh-my-posh.enable {
    environment.systemPackages =
    [
    pkgs.oh-my-posh
    ];
  
  };
}
