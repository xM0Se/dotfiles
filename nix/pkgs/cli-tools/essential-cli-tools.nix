{ pkgs, lib, config, ... }: {

  imports = [
      ./eza.nix
      ./oh-my-posh.nix
  ]; 
  options = {
    essential-cli-tools.enable =
      lib.mkEnableOption "enables essential-cli-tools";
  };

  config = lib.mkIf config.essential-cli-tools.enable {
    eza.enable = true;
    oh-my-posh.enable = true;
  };

}
