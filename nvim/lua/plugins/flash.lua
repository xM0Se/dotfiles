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
        { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump({ continue = true }) end, desc = "Flash continue Search" },
        {
            "<leader>sws",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    pattern = ".",
                    search = {
                        mode = function(pattern)
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                        end,
                    },
                    jump = { pos = "range" },
                })
            end,
            desc = "Flash search and select a word"
        },
        {
            "<leader>sl",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^"
                })
            end,
            desc = "Flash search Line"
        },
        { "<leader>r",  mode = "o",               function() require("flash").remote() end,                                     desc = "Flash remote" },
        { "<leader>R",  mode = { "o", "x" },      function() require("flash").treesitter_search() end,                          desc = "Flash Treesitter Search" },
        { "<leader>fw", mode = { "n", "x", "o" }, function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Flash Search with current word" },
    },
}
