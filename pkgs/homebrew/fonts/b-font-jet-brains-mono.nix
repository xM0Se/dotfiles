{
  lib,
  config,
  ...
}: {
  options = {
    b-font-jetbrains-mono.enable = lib.mkEnableOption "jet-brains-mono";
  };

  config = lib.mkIf config.b-font-jetbrains-mono.enable {
    homebrew.casks = ["font-jetbrains-mono"];
  };
}
