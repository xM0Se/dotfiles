{ pkgs, lib, config, ... }: {

    options = {
        b-brews-treesitter.enable =
            lib.mkEnableOption "installs treesitter cli via homebrew";
    };

    config = lib.mkIf config.b-brews-treesitter.enable {
        homebrew.brews = [
            "tree-sitter-cli"
        ];
    };

}
