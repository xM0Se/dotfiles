{ pkgs, lib, config, ... }: {

  options = {
    neofetch.enable =
      lib.mkEnableOption "enables neofetch";
  };

  config = lib.mkIf config.neofetch.enable {
    environment.systemPackages =
    [
    pkgs.neofetch
    ];

  };

}
