{ pkgs, lib, config, ... }: {

  options = {
    minecraft.enable =
      lib.mkEnableOption "installs minecraft via homebrew";
  };

  config = lib.mkIf config.minecraft.enable {
    homebrew.casks = [
    "minecraft"
    ];


  };
}
