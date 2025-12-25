{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-oh-my-posh.enable = lib.mkEnableOption "oh-my-posh, prompt engine";
  };

  config = lib.mkIf config.u-pkg-oh-my-posh.enable {
    environment.systemPackages = [pkgs.oh-my-posh];
  };
}
