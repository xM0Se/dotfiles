{ pkgs, lib, config, ... }: {

  options = {
    git.enable =
      lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {

  programs.git = {
    enable = true;
    userName = "xm0se";
    userEmail = "189546389+xM0Se@users.noreply.github.com";
  };

  };

}
