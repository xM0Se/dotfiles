return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        modes = {
            search = {
                enabled = true,
            },
            char = {
                jump_labels = true,
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "s",         mode = { "n", "x", "o" }, function() require("flash").jump() end,                    desc = "Flash" },
        { "S",         mode = { "n", "x", "o" }, function() require("flash").treesitter() end,              desc = "Flash Treesitter" },
        { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump({ continue = true }) end, desc = "continue flash search" },
        {
            "<leader>sl",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern =
                    "^"
                })
            end,
            desc = "Flash search Line "
        },
        { "<leader>r",  mode = "o",               function() require("flash").remote() end,                                     desc = "Remote Flash" },
        { "<leader>R",  mode = { "o", "x" },      function() require("flash").treesitter_search() end,                          desc = "Treesitter Search" },
        { "<leader>fw", mode = { "n", "x", "o" }, function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "flash with current word" },
        { "<c-s>",      mode = { "c" },           function() require("flash").toggle() end,                                     desc = "Toggle Flash Search" },
    },
}
