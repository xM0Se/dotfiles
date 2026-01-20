{
  lib,
  config,
  ...
}: {
  imports = [
    ./u-pkg-eza.nix
    ./u-pkg-oh-my-posh.nix
    ./u-pkg-zoxide.nix
    ./u-pkg-neofetch.nix
    ./u-pkg-vim.nix
    ./u-pkg-tmux.nix
    ./u-pkg-fzf.nix
    ./u-pkg-btop.nix
    ./u-pkg-bat.nix
    ./u-pkg-git.nix
    ./u-pkg-pay-respects.nix
    ./u-pkg-zsh.nix
    ./u-pkg-chawan.nix
  ];
  options = {
    essential-cli-tools.enable = lib.mkEnableOption "essential-cli-tools";
  };

  config = lib.mkIf config.essential-cli-tools.enable {
    u-pkg-eza.enable =
      lib.mkDefault true;
    u-pkg-oh-my-posh.enable =
      lib.mkDefault true;
    u-pkg-zoxide.enable =
      lib.mkDefault true;
    u-pkg-neofetch.enable =
      lib.mkDefault true;
    u-pkg-vim.enable =
      lib.mkDefault true;
    u-pkg-tmux.enable =
      lib.mkDefault true;
    u-pkg-fzf.enable =
      lib.mkDefault true;
    u-pkg-btop.enable =
      lib.mkDefault true;
    u-pkg-bat.enable =
      lib.mkDefault true;
    u-pkg-git.enable =
      lib.mkDefault true;
    u-pkg-pay-respects.enable =
      lib.mkDefault true;
    u-pkg-zsh.enable =
      lib.mkDefault true;
    u-pkg-chawan.enable =
      lib.mkDefault true;
  };
}
