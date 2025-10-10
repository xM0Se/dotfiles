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
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",

            config = function()
                -- ✅ Define diagnostic signs (nerd font safe)
                local signs = {
                    Error = " ",
                    Warn  = " ",
                    Hint  = " ",
                    Info  = " ",
                }

                for type, icon in pairs(signs) do
                    local hl = "DiagnosticSign" .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                end

                -- ✅ Configure diagnostics behavior
                vim.diagnostic.config({
                    virtual_text = {
                        prefix = "●", -- change to "" if you want no inline icons
                    },
                    signs = true,
                    underline = true,
                    update_in_insert = false,
                    severity_sort = true,
                    float = {
                        border = "rounded",
                        source = "always",
                    },
                })
            end,
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
