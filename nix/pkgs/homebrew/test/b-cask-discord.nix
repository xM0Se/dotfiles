{ pkgs, lib, config, ... }: {

  options = {
    b-cask-discord.enable =
      lib.mkEnableOption "installs discord via homebrew casks";
  };

  config = lib.mkIf config.b-cask-discord.enable {
    homebrew.casks = [
    "discord"
    ];
  };
}
