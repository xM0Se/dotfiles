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
      enableZshIntegration = true;
    };
  };
}
