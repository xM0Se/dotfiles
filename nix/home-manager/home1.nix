{ config, pkgs, ... }:

{
  imports = [
  inputs.nvf.homeManagerModules.default
    ./vscode/vscodeconf.nix
    ./gitconf.nix
#    ./tmux/tmuxconf.nix
    ./nvim/test.nix
  ];

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
    ".zshrc".source = ../../zshrc/.zshrc;
    ".aerospace.toml".source = ../../aerospace/.aerospace.toml;
    ".config/sketchybar".source = ../../sketchybar/.config/sketchybar;
    "library/application support/com.mitchellh.ghostty/config".source = ../../ghostty/config;
    ".wezterm.lua".source = ../../wezterm/.wezterm.lua;
    ".config/ohmyposh/base.json".source = ../../ohmyposh/base.json;
    ".config/nvimnix".source =  ../../nvim;
    "qmk_firmware/keyboards/crkbd/keymaps/custom".source = ../../qmk;
  };

  programs.home-manager.enable = true;
}
