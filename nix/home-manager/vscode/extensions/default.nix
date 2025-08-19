{ pkgs, lib, config, ... }: {

  imports = [
      ./dracula-theme.nix
  ];

  options = {
    vs-code-extentions.enable =
      lib.mkEnableOption "vs-code-extentions";
  };

  config = lib.mkIf config.vs-code-extentions.enable {
    dracula-theme.enable =
      lib.mkDefault true;
  };

}
