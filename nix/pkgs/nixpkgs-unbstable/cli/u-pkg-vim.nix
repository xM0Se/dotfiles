{ pkgs, lib, config, ... }: {

  options = {
    vim.enable =
      lib.mkEnableOption "enables vim";
  };

  config = lib.mkIf config.vim.enable {
    environment.systemPackages =
    [
    pkgs.vim
    ];

  };

}
