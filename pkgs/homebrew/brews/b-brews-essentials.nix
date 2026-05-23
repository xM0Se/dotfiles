{
  lib,
  config,
  ...
}: {
  imports = [
    ./b-brews-treesitter.nix
  ];

  options = {
    b-brews-essentials.enable =
      lib.mkEnableOption "enables essential-brew cli tools";
  };

  config = lib.mkIf config.b-brews-essentials.enable {
    b-brews-treesitter.enable =
      lib.mkDefault true;
  };
}
