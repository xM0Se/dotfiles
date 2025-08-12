{ pkgs, lib, config, ... }: {

  options = {
    atuin.enable =
      lib.mkEnableOption "installs atuin using nixpkgs unstable";
  };

  config = lib.mkIf config.atuin.enable {
    environment.systemPackages =
    [
    pkgs.atuin
    ];
  };
}
