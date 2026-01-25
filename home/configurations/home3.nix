{pkgs, ...}: {
  imports = [
    ./zsh/zshconf.nix
    ./gitconf.nix
    ./tmux/tmuxconf.nix
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
