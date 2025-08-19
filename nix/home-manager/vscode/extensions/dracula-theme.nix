{ pkgs, lib, config, ... }: {

  options = {
    dracula-theme.enable =
      lib.mkEnableOption "installs dracula-theme for vscode";
  };

  config = lib.mkIf config.dracula-theme.enable {
    programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
    ];
  };
}
