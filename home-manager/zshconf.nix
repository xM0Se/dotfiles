{
  lib,
  config,
  ...
}: {
  options = {
    zshconf.enable =
      lib.mkEnableOption "enables zshconf";
  };

  config = lib.mkIf config.zshconf.enable {
    home.file = {
      ".zshrc".source = ../../zshrc/.zshrc;
    };
  };
}
