{
  lib,
  config,
  ...
}: {
  options = {
    b-cask-ghostty.enable =
      lib.mkEnableOption "ghostty, terminal emulator";
  };

  config = lib.mkIf config.b-cask-ghostty.enable {
    homebrew.casks = [
      "ghostty"
    ];
  };
}
