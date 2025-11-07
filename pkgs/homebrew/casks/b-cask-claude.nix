{ pkgs, lib, config, ... }: {

  options = {
    b-cask-claude.enable =
      lib.mkEnableOption "installs claude via homebrew casks";
  };

  config = lib.mkIf config.b-cask-claude.enable {
    homebrew.casks = [
    "claude"
    ];
  };
}
