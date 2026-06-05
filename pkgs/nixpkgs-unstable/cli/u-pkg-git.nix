{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-git.enable = lib.mkEnableOption "git, version control";
  };

  config = lib.mkIf config.u-pkg-git.enable {
    environment.systemPackages = [pkgs.git];
  };
}
