{ pkgs, lib, config, ... }: {

  options = {
    ohmyposhconf.enable =
      lib.mkEnableOption "enables ohmyposhconf";
  };

  config = lib.mkIf config.ohmyposhconf.enable {
    home.file = {
      ".config/ohmyposh/base.json".source = ../../ohmyposh/base.json;
    };
  };
}
