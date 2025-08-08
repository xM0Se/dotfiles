{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "xm0se";
    userEmail = "189546389+xM0Se@users.noreply.github.com";
  };
  programs.btop = {
    enable = true;
    settings  = {
      color_theme = "Default";
      theme_background = false;
    };

  };
  home.packages = [
     pkgs.hello
  ];

  home.file = {
  };

  programs.home-manager.enable = true;
}
