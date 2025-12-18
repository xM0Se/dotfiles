{
  lib,
  config,
  ...
}: {
  options = {
    b-font-sf-symbols.enable =
      lib.mkEnableOption "installs sf-symbols using homebrew casks";
  };

  config = lib.mkIf config.b-font-sf-symbols.enable {
    homebrew.casks = [
      "sf-symbols"
    ];
  };
}
