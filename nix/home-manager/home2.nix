{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "25.05";

  imports = [
      ./test.nix
  ];
  git.enable = true;

  programs.btop = {
    enable = true;
    settings  = {
      color_theme = "dracula";
      theme_background = false;
      truecolor = true;
      vim_keys = true;
    };
  };

  home.packages = [
     pkgs.hello
  ];

  home.file = {
  };

  programs.home-manager.enable = true;
}
