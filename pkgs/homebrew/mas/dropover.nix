{
  lib,
  config,
  ...
}: {
  options = {
    brew.mas.dropover.enable =
      lib.mkEnableOption "dropover, Easier Drag & Drop";
  };

  config = lib.mkIf config.brew.mas.dropover.enable {
    homebrew.masApps = {
      "Dropover - Easier Drag & Drop" = 1355679052;
    };
  };
}
