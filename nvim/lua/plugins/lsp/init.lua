return {

    {
        "mason-org/mason-lspconfig.nvim",

        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
                            handlers = {
                    function(server)
                        lspconfig[server].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
        },

        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "neovim/nvim-lspconfig",
            },
        },
    },

    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = { preset = "super-tab" },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = { documentation = { auto_show = false } },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
}
