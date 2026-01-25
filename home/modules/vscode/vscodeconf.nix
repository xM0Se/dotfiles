{
  lib,
  config,
  ...
}: {
  imports = [
    ./settings/default-settings.nix
    ./extensions/default.nix
  ];

  options = {
    vscodeconf.enable =
      lib.mkEnableOption "enables vscodeconf";
  };

  config = lib.mkIf config.vscodeconf.enable {
    programs.vscode.enable = true;
    default-settings.enable =
      lib.mkDefault true;
    vs-code-extentions.enable =
      lib.mkDefault true;
  };
}
