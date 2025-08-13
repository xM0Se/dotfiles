{ pkgs, lib, config, ... }: {

  options = {
    git.enable =
      lib.mkEnableOption "installs git using nixpkgs unstable";
  };

  config = lib.mkIf config.git.enable {
    environment.systemPackages =
    [
    pkgs.git
    ];
  };
}

