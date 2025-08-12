{ pkgs, lib, config, ... }: {

  options = {
    zoxide.enable =
      lib.mkEnableOption "installs zoxide using nixpkgs unstable";
  };

  config = lib.mkIf config.zoxide.enable {
    environment.systemPackages =
    [
    pkgs.zoxide
    ];
  };
}
