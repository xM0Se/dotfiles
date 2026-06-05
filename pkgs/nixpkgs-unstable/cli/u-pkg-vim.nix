{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    u-pkg-vim.enable = lib.mkEnableOption "vim, text editor";
  };

  config = lib.mkIf config.u-pkg-vim.enable {
    environment.systemPackages = [pkgs.vim];
  };
}
