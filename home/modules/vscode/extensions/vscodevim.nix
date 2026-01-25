{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    vscodevim.enable =
      lib.mkEnableOption "installs vscodevim for vscode";
  };

  config = lib.mkIf config.vscodevim.enable {
    programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ];
  };
}
