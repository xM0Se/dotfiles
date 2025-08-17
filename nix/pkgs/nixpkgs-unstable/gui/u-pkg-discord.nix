{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-discord.enable =
      lib.mkEnableOption "installs alacritty using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-discord.enable {
    environment.systemPackages =
    [
    pkgs.discord
    ];
  };
}
