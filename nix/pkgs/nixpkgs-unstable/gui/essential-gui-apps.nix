{ pkgs, lib, config, ... }: {

  imports = [
    ./u-pkg-wezterm.nix
  ];

  options = {
    essential-gui-apps.enable =
      lib.mkEnableOption "enables essential-cli-tools";
  };

  config = lib.mkIf config.essential-cli-tools.enable {
    u-pkg-wezterm.enable =
      lib.mkDefault true
  };

}
