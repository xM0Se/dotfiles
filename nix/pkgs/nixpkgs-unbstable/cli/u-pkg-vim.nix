{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-vim.enable =
      lib.mkEnableOption "enables vim";
  };

  config = lib.mkIf config.u-pkg-vim.enable {
    environment.systemPackages =
    [
    pkgs.vim
    ];

  };

}
