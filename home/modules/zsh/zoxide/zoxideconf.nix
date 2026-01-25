{
  lib,
  config,
  ...
}: {
  options = {
    zoxideconf.enable = lib.mkEnableOption "zoxideconf";
  };

  config = lib.mkIf config.zoxideconf.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
