{ config, pkgs, ... }:

{
  imports = [
    ./jankyborderconf.nix
    ./vscode/vscodeconf.nix
    ./gitconf.nix
    ./tmux/tmuxconf.nix
  ];

  home.username = "xm0se";
  home.homeDirectory = "/Users/xm0se";


  jankyborderconf.enable = true;
  vscodeconf.enable = true;
  gitconf.enable = true;
  tmuxconf.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
     pkgs.hello
  ];

  home.file = {
    ".zshrc".source = ../../zshrc/.zshrc;
    ".aerospace.toml".source = ../../aerospace/.aerospace.toml;
    ".config/sketchybar".source = ../../sketchybar/.config/sketchybar;
    "Library/Application Support/com.mitchellh.ghostty/config".source = ../../ghostty/config;
    ".wezterm.lua".source = ../../wezterm/.wezterm.lua;
    ".config/ohmyposh/base.json".source = ../../ohmyposh/base.json;
  };

  programs.home-manager.enable = true;
}
