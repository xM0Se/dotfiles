{ pkgs, lib, config, ... }: {

  options = {
    vscodeconf.enable =
      lib.mkEnableOption "enables vscodeconf";
  };

  config = lib.mkIf config.vscodeconf.enable {

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
