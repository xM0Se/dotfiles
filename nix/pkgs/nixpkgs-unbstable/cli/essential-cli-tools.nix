{ pkgs, lib, config, ... }: {

  imports = [
      ./eza.nix
      ./oh-my-posh.nix
      ./atuin.nix
      ./zoxide.nix
  ]; 
  options = {
    essential-cli-tools.enable =
      lib.mkEnableOption "enables essential-cli-tools";
  };

  config = lib.mkIf config.essential-cli-tools.enable {
    eza.enable = 
	lib.mkDefault true;
    oh-my-posh.enable = 
	lib.mkDefault true;
    atuin.enable =
        lib.mkDefault true;
    zoxide.enable =
        lib.mkDefault true;
  };

}
