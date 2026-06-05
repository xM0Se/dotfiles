{
  lib,
  config,
  ...
}: {
  options = {
    b-opts-default.enable =
      lib.mkEnableOption "installs DaVinciResolve via the mac appstore";
  };

  config = lib.mkIf config.b-opts-default.enable {
    homebrew = {
      enable = true;
      onActivation.cleanup = "zap";
    };
  };
}
