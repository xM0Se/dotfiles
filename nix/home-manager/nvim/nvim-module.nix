{ pkgs, lib, ... }: {
    vim = {
        theme = {
            enable = true;
            name = "rose-pine";
            style = "rose-pine";
        };
    };

    autocomplete.blink-cmp.enable = true;
    git.gitsigns.enable = true;
    utility.motion.flash-nvim.enable = true;
    mini.pairs.enable = true;
    mini.indentscope.enable = true;
    utility.snacks-nvim.enable = true;
    utility.undotree.enable = true;

    languages = {
        enableLsp = true;
        enableTreesitter = true;
        nix.enable = true;
        lua.enable = true;
        enableFormat = true;
    };
}
