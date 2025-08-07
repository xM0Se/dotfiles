{ pkgs, lib, config, ... }: {

  options = {
    essential-cli-tools.enable = 
      lib.mkEnableOption "enables essential-cli-tools";
  };

  config = lib.mkIf config.essential-cli-tools.enable {
    imports = [
       ./oh-my-posh.nix
    ];
  };

}
