{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-bat.enable =
      lib.mkEnableOption "installs bat using nixpkgs unstable";
  };

  config = lib.mkIf config.u-pkg-bat.enable {
    environment.systemPackages =
    [
    pkgs.bat
    ];
  };
}
