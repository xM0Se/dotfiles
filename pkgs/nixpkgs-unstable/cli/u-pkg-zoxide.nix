{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-zoxide.enable =
      lib.mkEnableOption "zoxide, better cd";
  };

  config = lib.mkIf config.u-pkg-zoxide.enable {
    environment.systemPackages = [pkgs.zoxide];
  };
}
