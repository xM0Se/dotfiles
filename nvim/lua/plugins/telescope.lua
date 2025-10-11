return {

    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-c>"] = require("telescope.actions").close,
                },
                n = {
                    ["q"] = require("telescope.actions").close,
                },
            },
            attach_mappings = function(prompt_bufnr, _)
                vim.api.nvim_buf_attach(prompt_bufnr, false, {
                    on_lines = function()
                        if require("telescope.actions.state").get_current_line() == ":q" then
                            require("telescope.actions").close(prompt_bufnr)
                        end
                    end,
                })
                return true
            end,
        },
    },
    branch = "master",
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope help tags",
        },
    },
}
