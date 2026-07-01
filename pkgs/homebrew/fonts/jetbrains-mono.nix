{
  lib,
  config,
  ...
}: {
  options = {
    brew.font.jetbrains-mono.enable =
      lib.mkEnableOption "jet-brains-mono";
  };

  config = lib.mkIf config.brew.font.jetbrains-mono.enable {
    homebrew.casks = [
      "font-jetbrains-mono"
    ];
  };
}
