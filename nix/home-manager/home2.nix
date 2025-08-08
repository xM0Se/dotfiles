{ config, pkgs, ... }:

{

  home.stateVersion = "25.05";

  home.packages = [
     pkgs.hello
  ];

  home.file = {
  };

  programs.home-manager.enable = true;
}
