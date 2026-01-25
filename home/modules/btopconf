{
  lib,
  config,
  ...
}: {
  options = {
    btopconf.enable =
      lib.mkEnableOption "enables btopconf";
  };

  config = lib.mkIf config.btopconf.enable {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "dracula";
        theme_background = false;
        truecolor = true;
        vim_keys = true;
      };
    };
  };
}
