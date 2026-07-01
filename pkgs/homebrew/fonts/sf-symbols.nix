{
  lib,
  config,
  ...
}: {
  options = {
    brew.font.sf-symbols.enable =
      lib.mkEnableOption "sf-symbols";
  };

  config = lib.mkIf config.brew.font.sf-symbols.enable {
    homebrew.casks = [
      "sf-symbols"
    ];
  };
}
