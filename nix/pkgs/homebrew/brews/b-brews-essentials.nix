{ pkgs, lib, config, ... }: {

    imports = [
        ./b-brews-borders.nix
        ./b-brews-sketchybar.nix
        ./b-brews-treesitter.nix
    ];

    options = {
        b-brews-essentials.enable =
            lib.mkEnableOption "enables essential-brew cli tools";
    };

    config = lib.mkIf config.b-brews-essentials.enable {
        b-brews-borders.enable =
            lib.mkEnableOption true;
        b-brews-sketchybar.enable =
            lib.mkEnableOption true;
        b-brews-treesitter.enable =
            lib.mkEnableOption true;
    };

}
