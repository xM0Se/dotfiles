{
  lib,
  config,
  ...
}: {
  options = {
    brew.font.hack-nerd-font.enable =
      lib.mkEnableOption "hack-nerd-font";
  };

  config = lib.mkIf config.brew.font.hack-nerd-font.enable {
    homebrew.casks = [
      "font-hack-nerd-font"
    ];
  };
}
