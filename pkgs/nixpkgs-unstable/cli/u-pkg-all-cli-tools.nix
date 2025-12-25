{
  lib,
  config,
  ...
}: {
  imports = [
    ./u-pkg-qmk.nix
  ];
  options = {
    u-pkgs-all-cli-tools.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.u-pkgs-all-cli-tools.enable {
    u-pkg-qmk.enable =
      lib.mkDefault false;
  };
}
