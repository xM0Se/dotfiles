{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.blackhole.enable =
      lib.mkEnableOption "blackhole, virtual audio routing";
  };

  config = lib.mkIf config.brew.cask.blackhole.enable {
    homebrew.casks = [
      "blackhole-2ch"
      "blackhole-16ch"
    ];
  };
}
