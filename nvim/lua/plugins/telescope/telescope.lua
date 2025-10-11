return {

    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            mappings = {
                attach_mappings = function(prompt_bufnr, _)
                    vim.api.nvim_buf_attach(prompt_bufnr, false, {
                        on_lines = function()
                            local prompt = require("telescope.actions.state").get_current_line()
                            if not prompt or prompt == ":q" then
                                require("telescope.actions").close(prompt_bufnr)
                            end
                        end,
                    })
                    return true
                end,
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
