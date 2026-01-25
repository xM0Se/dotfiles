{pkgs, ...}: {
  imports = [
    ./../modules/zsh/zshconf.nix
    ./../modules/gitconf.nix
    ./../modules/tmux/tmuxconf.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "bat";
  };

  home.username = "root";
  home.homeDirectory = "/root";

  zshconf.enable = true;
  gitconf.enable = true;
  tmuxconf.enable = true;

  home.packages = [
    pkgs.hello
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
