{ config, pkgs, ... }:

{
  home.username = "xm0se";
  home.homeDirectory = "/Users/xm0se";

  programs.vscode = {
    enable = true;
    profiles.default = {
		userSettings = {
			"workbench.colorTheme" = "Dracula Theme";
		};
		extensions = with pkgs.vscode-extensions; [
          dracula-theme.theme-dracula
   		  vscodevim.vim
          yzhang.markdown-all-in-one
  		];
	};
  };

  imports = [
    ./jankyborderconf.nix
  ];
  jankyborderconf.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
     pkgs.hello
  ];

  home.file = {
    ".zshrc".source = /Users/xm0se/dotfiles/zshrc/.zshrc;
    ".aerospace.toml".source = /Users/xm0se/dotfiles/aerospace/.aerospace.toml;
    ".config/sketchybar".source = /Users/xm0se/dotfiles/sketchybar/.config/sketchybar;
    "Library/Application Support/com.mitchellh.ghostty/config".source = /Users/xm0se/dotfiles/ghostty/config;
    ".wezterm.lua".source = /Users/xm0se/dotfiles/wezterm/.wezterm.lua;
    ".config/ohmyposh/base.json".source = /Users/xm0se/dotfiles/ohmyposh/base.json;
  };

  programs.home-manager.enable = true;
}
