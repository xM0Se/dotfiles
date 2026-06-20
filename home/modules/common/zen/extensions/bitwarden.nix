{
  lib,
  config,
  programs,
  ...
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.bitwarden.enable = lib.mkEnableOption "installs bitwarden";

  config = lib.mkIf ext.cfg.bitwarden.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
    };
  };
}
