return {

    {
        "mason-org/mason-lspconfig.nvim",

        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
        },

        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "neovim/nvim-lspconfig",

                config = function()
                    local capabilites = require("blink.cmp").get_lsp_capabilities()
                    require("lspconfig").lua_ls.setup({ capabilites = capabilites })
                end,
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
