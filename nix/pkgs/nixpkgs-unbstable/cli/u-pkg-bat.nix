{ pkgs, lib, config, ... }: {

  options = {
    bat.enable =
      lib.mkEnableOption "installs bat using nixpkgs unstable";
  };

  config = lib.mkIf config.bat.enable {
    environment.systemPackages =
    [
    pkgs.bat
    ];
  };
}
