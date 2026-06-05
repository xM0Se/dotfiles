{
  lib,
  config,
  ...
}: {
  options = {
    oh-my-poshconf.enable = lib.mkEnableOption "oh-my-poshconf";
  };
  config = lib.mkIf config.oh-my-poshconf.enable {
    programs.oh-my-posh = {
      enable = true;
      configFile = ./base.json;
      enableZshIntegration = true;
    };
  };
}
