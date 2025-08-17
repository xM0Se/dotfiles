{ pkgs, lib, config, ... }: {

  imports = [
    ./terminal/u-pkg-wezterm.nix
    ./terminal/u-pkg-ghostty.nix
    ./terminal/u-pkg-alacritty.nix
    ./u-pkg-discord.nix
  ];

  options = {
    essential-gui-apps.enable =
      lib.mkEnableOption "enables essential-cli-tools";
  };

  config = lib.mkIf config.essential-cli-tools.enable {
    u-pkg-wezterm.enable =
      lib.mkDefault true;
    u-pkg-ghostty.enable =
      lib.mkDefault true;
    u-pkg-alacritty.enable =
      lib.mkDefault true;
    u-pkg-discord.enable =
      lib.mkDefault true;
  };

}
