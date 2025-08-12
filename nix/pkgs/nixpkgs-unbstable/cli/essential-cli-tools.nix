{ pkgs, lib, config, ... }: {

  imports = [
      ./u-pkg-eza.nix
      ./u-pkg-oh-my-posh.nix
      ./u-pkg-atuin.nix
      ./u-pkg-zoxide.nix
      ./u-pkg-neofetch.nix
      ./u-pkg-vim.nix
      ./u-pkg-neovim.nix
      ./u-pkg-tmux.nix
      ./u-pkg-fzf.nix
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
    neofetch.enable =
        lib.mkDefault true;
    vim.enable =
        lib.mkDefault true;
    neovim.enable =
        lib.mkDefault true;
    tmux.enable =
        lib.mkDefault true;
    fzf.enable =
        lib.mkDefault true;
  };

}
