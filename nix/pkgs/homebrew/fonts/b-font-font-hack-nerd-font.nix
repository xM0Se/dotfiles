{ pkgs, lib, config, ... }: {

  options = {
    b-font-font-hack-nerd-font.enable =
      lib.mkEnableOption "installs font-hack-nerd-font using homebrew casks";
  };

  config = lib.mkIf config.u-font-font-hack-nerd-font.enable {
    homebrew.casks = [
      "sf-symbols"
    ];
  };

}
