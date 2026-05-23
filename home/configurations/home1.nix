{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./../modules/vscode/vscodeconf.nix
    ./../modules/zsh/zshconf.nix
    ./../modules/gitconf.nix
    ./../modules/tmux/tmuxconf.nix
    ./../modules/zen/zenconf.nix
    ./../modules/sketchybar/default.nix
    ./../modules/aerospace/default.nix
    ./../modules/borders/default.nix
    ./../modules/ghostty/default.nix
    ./../modules/vesktop/default.nix
  ];

  vscodeconf.enable = true;
  zshconf.enable = true;
  gitconf.enable = true;
  tmuxconf.enable = true;

  home = {
    username = "xm0se";
    homeDirectory = "/Users/xm0se";
    packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
    ];
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
    };
    file = {
      "qmk_firmware/keyboards/crkbd/keymaps/custom".source = /Users/xm0se/dotfiles-for-humans/qmk;
    };
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
