{ pkgs, lib, config, ... }: {

  options = {
    hotcornerconf.enable =
      lib.mkEnableOption "enables hotcornerconf";
  };

  config = lib.mkIf config.hotcornerconf.enable {

    system.defaults.dock = {
      wvous-tr-corner = 1;
      wvous-tl-corner = 1;
      wvous-br-corner = 1;
      wvous-bl-corner = 1;
    };

  };
}
