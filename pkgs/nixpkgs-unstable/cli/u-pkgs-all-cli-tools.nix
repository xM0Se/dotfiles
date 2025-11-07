{ pkgs, lib, config, ... }: {

  imports = [
      ./u-pkg-qmk.nix
  ];
  options = {
    u-pkgs-all-cli-tools.enable =
      lib.mkEnableOption "all cli tools spezifyed are disabled by deafault to turn them on turn pkg.enable to true";
  };

  config = lib.mkIf config.u-pkgs-all-cli-tools.enable {
    u-pkg-qmk.enable =
        lib.mkDefault false;
  };

}
