return {

    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<CR>"] = function(bufnr)
                        local prompt = require("telescope.actions.state").get_current_line()
                        if not prompt or prompt == ":q" then
                            require("telescope.actions").close(bufnr)
                        else
                            require("telescope.actions").select_default(bufnr)
                        end
                    end,
                },
                n = {
                    ["q"] = require("telescope.actions").close,
                },
            },
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
