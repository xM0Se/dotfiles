{ pkgs, lib, config, ... }: {

  options = {
    b-cask-minecraft.enable =
      lib.mkEnableOption "installs minecraft via homebrew";
  };

  config = lib.mkIf config.b-cask-minecraft.enable {
    homebrew.casks = [
    "minecraft"
    ];


  };
}
