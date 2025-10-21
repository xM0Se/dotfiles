{ pkgs, lib, config, ... }: {

    imports = [
        ./b-brews-borders.nix
        ./b-brews-sketchybar.nix
        ./b-brews-treesitter.nix
    ];

    options = {
        essential-brew-mac-apps.enable =
            lib.mkEnableOption "enables essential-brew cli tools";
    };

    config = lib.mkIf config.essential-brew-mac-apps.enable {
        b-brews-borders.enable =
            lib.mkEnableOption true;
        b-brews-sketchybar.enable =
            lib.mkEnableOption true;
        b-brews-treesitter.enable =
            lib.mkEnableOption true;
    };

}
