return {
    "folke/zen-mode.nvim",
    dependencies = {
        { "folke/twilight.nvim", opts = {} },
    },

    opts = {
        window = {
            width = 1, -- use full width, no resizing
            height = 1, -- use full height, no resizing
        },
    },
    keys = {
        {
            "<leader>z",
            mode = { "n", "x", "o" },
            function()
                require("zen-mode").toggle()
            end,
            desc = "toggles zen-mode",
        },
    },
}
