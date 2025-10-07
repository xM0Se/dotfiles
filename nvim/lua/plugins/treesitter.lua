return {

    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts_extend = { "ensure_installed" },
    opts = {
        indent = { enable = true },
        highlight = { enable = true },
        folds = { enable = true },
        ensure_installed = {
            "bash",
            "json",
            "lua",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
            "nix",
        },
    },

}
