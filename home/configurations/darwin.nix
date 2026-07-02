{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./../modules/widgets.nix
    ./../modules/wallpaper.nix
    ./../modules/common/sops.nix
    ./../modules/common/vscode/vscodeconf.nix
    # ./../modules/common/vesktop/default.nix
    ./../modules/common/zsh/zsh.nix
    ./../modules/common/git.nix
    ./../modules/common/zen/default.nix
    ./../modules/darwin/sketchybar/default.nix
    ./../modules/darwin/aerospace/default.nix
    ./../modules/darwin/borders/default.nix
    ./../modules/darwin/ghostty/default.nix
  ];

  vscodeconf.enable = true;
  zshconf.enable = true;
  gitconf.enable = true;

  home = {
    packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
    ];
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
    };
    # file = {
    #   "qmk_firmware/keyboards/crkbd/keymaps/custom".source = /Users/xm0se/dotfiles-for-humans/qmk;
    # };
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
