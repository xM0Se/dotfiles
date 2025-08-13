{ pkgs, lib, config, ... }: {

  options = {
    u-pkg-neovim.enable =
      lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.u-pkg-neovim.enable {
    environment.systemPackages =
    [
    pkgs.neovim
    ];

  };

}
