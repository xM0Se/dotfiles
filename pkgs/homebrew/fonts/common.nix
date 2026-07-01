{
  lib,
  config,
  ...
}: {
  imports = [
    ./sketchybar-app-font.nix
    ./sf-symbols.nix
    ./hack-nerd-font.nix
    ./jetbrains-mono.nix
  ];

  options = {
    brew.font.common.enable =
      lib.mkEnableOption "common fonts";
  };

  config = lib.mkIf config.brew.font.common.enable {
    brew.font = {
      sketchybar-app-font.enable =
        lib.mkDefault true;
      sf-symbols.enable =
        lib.mkDefault true;
      hack-nerd-font.enable =
        lib.mkDefault true;
      jetbrains-mono.enable =
        lib.mkDefault true;
    };
  };
}
