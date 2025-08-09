{ pkgs, lib, config, ... }: {

  options = {
    gitconf.enable =
      lib.mkEnableOption "enables gitconf";
  };

  config = lib.mkIf config.gitconf.enable {

  programs.git = {
    enable = true;
    userName = "xm0se";
    userEmail = "189546389+xM0Se@users.noreply.github.com";
  };

  };

}
