{ pkgs, lib, config, ... }: {

  options = {
    default-theme.enable =
      lib.mkEnableOption "sets the default thme to dracula";
  };

  config = lib.mkIf config.default-theme.enable {
    programs.vscode.profiles.default.userSettings = {
		  "workbench.colorTheme" = "Dracula Theme";
    };
  };

}
