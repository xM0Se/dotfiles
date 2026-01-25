{
  lib,
  config,
  ...
}: {
  options = {
    atuinconf.enable = lib.mkEnableOption "atuinconf";
  };

  config = lib.mkIf config.atuinconf.enable {
    programs.atuin = {
      enable = true;
      settings = {
        enter_accept = false;
      };
      forceOverwriteSettings = true;
      enableZshIntegration = true;
    };
  };
}
