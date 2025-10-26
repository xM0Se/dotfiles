{ pkgs, lib, config, ... }: {

    programs.nvf = {
        enable = true;
        settings = {
            vim.autocomplete.blink-cmp.enable = true;
            vim.git.gitsigns.enable = true;
            vim.utility.motion.flash-nvim.enable = true;
            vim.mini.pairs.enable = true;
            vim.mini.indentscope.enable = true;
            vim.utility.snacks-nvim.enable = true;
            vim.utility.undotree.enable = true;
            vim.viAlias = true;
            vim.vimAlias = true;
            vim.lsp = {
                enable = true;
            };
            vim.languages = {
                enableTreesitter = true;
                nix.enable = true;
                lua.enable = true;
                enableFormat = true;
            };
        };

    };

}
