{
  lib,
  config,
  ...
}: {
  options = {
    pay-respectsconf.enable = lib.mkEnableOption "pay-respectsconf";
  };

  config = lib.mkIf config.pay-respectsconf.enable {
    programs.pay-respects = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
