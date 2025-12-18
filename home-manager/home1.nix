{pkgs, ...}: {
  imports = [
    ./vscode/vscodeconf.nix
    ./gitconf.nix
    #    ./tmux/tmuxconf.nix
    ./zen/zenconf.nix
  ];

  programs.firefox.darwinDefaultsId = "app.zen-browser.zen";
  home.username = "xm0se";
  home.homeDirectory = "/Users/xm0se";

  vscodeconf.enable = true;
  gitconf.enable = true;
  #  tmuxconf.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.hello
  ];

  home.file = {
    ".zshrc".source = /Users/xm0se/dotfiles-for-humans/zshrc/.zshrc;
    ".aerospace.toml".source = /Users/xm0se/dotfiles-for-humans/aerospace/.aerospace.toml;
    ".config/sketchybar".source = /Users/xm0se/dotfiles-for-humans/sketchybar/.config/sketchybar;
    "library/application support/com.mitchellh.ghostty/config".source = /Users/xm0se/dotfiles-for-humans/ghostty/config;
    ".wezterm.lua".source = /Users/xm0se/dotfiles-for-humans/wezterm/.wezterm.lua;
    ".config/ohmyposh/base.json".source = /Users/xm0se/dotfiles-for-humans/ohmyposh/base.json;
    "qmk_firmware/keyboards/crkbd/keymaps/custom".source = /Users/xm0se/dotfiles-for-humans/qmk;
  };
  programs.home-manager.enable = true;
}
