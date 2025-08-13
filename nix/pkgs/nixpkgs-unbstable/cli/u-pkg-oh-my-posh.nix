{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-oh-my-posh.nix.enable = 
      lib.mkEnableOption "enables oh-my-posh";
  };

  config = lib.mkIf config.u-pkg-oh-my-posh.enable {
    environment.systemPackages =
    [
    pkgs.oh-my-posh
    ];
  
  };
}
