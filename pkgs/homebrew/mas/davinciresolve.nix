{
  lib,
  config,
  ...
}: {
  options = {
    brew.mas.davinciresolve.enable =
      lib.mkEnableOption "DaVinciResolve, video editor";
  };

  config = lib.mkIf config.brew.mas.davinciresolve.enable {
    homebrew.masApps = {
      "DaVinci Resolve" = 571213070;
    };
  };
}
