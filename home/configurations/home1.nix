{pkgs, ...}: {
  imports = [
    ./vscode/vscodeconf.nix
    ./zsh/zshconf.nix
    ./gitconf.nix
    ./tmux/tmuxconf.nix
    ./zen/zenconf.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "bat";
  };

  programs.firefox.darwinDefaultsId = "app.zen-browser.zen";
  home.username = "xm0se";
  home.homeDirectory = "/Users/xm0se";

  vscodeconf.enable = true;
  zshconf.enable = true;
  gitconf.enable = true;
  tmuxconf.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.hello
  ];

  home.file = {
    ".aerospace.toml".source = /Users/xm0se/dotfiles-for-humans/aerospace/.aerospace.toml;
    ".config/sketchybar".source = /Users/xm0se/dotfiles-for-humans/sketchybar;
    "library/application support/com.mitchellh.ghostty".source = /Users/xm0se/dotfiles-for-humans/ghostty;
    ".wezterm.lua".source = /Users/xm0se/dotfiles-for-humans/wezterm/.wezterm.lua;
    ".config/ohmyposh".source = /Users/xm0se/dotfiles-for-humans/ohmyposh;
    "qmk_firmware/keyboards/crkbd/keymaps/custom".source = /Users/xm0se/dotfiles-for-humans/qmk;
  };
  programs.home-manager.enable = true;
}
