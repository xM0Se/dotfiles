{ pkgs, lib, config, ... }: {

  options = {
    docksettings.enable =
      lib.mkEnableOption "enables custum dock settings";
  };

  config = lib.mkIf config.docksettings.enable {
    system.defaults.dock = {
      autohide = true;
      tilesize = 1;
      orientation = "left";
      static-only = true;
      autohide-delay = 5.0;
      show-recents = false;
      show-process-indicators = false;
    };
  };
}
