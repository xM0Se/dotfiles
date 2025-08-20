{ pkgs, lib, config, ... }: {

  imports = [
    ./default-theme.nix
  ];

  options = {
    default-settings.enable =
      lib.mkEnableOption "enables custom settings";
  };

  config = lib.mkIf config.default-settings.enable {
    default-theme.enable =
      lib.mkDefault true;
  };

}
