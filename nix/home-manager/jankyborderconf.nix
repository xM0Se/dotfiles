{ pkgs, lib, config, nix-homebrew, ... }: {

  options = {
    jankyborderconf.enable =
      lib.mkEnableOption "enables jankyborderconf";
  };

  config = lib.mkIf config.jankyborderconf.enable {
    services.jankyborders = {
      enable = true;
      package = pkgs.emptyDirectory;
      settings = {
        active_color = "0xffffffff";
        inactive_color = "0xff56606d";
        hidpi = "off";
        style = "round";
        width = 6.0;
      };
    };
  };
}
