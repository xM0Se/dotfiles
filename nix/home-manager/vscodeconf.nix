{ pkgs, lib, config, ... }: {

  options = {
    gitconf.enable =
      lib.mkEnableOption "enables gitconf";
  };

  config = lib.mkIf config.gitconf.enable {

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

  };
}
