return {
  
    "gbprod/yanky.nvim",
    opts = {
      preserve_cursor_position.enabled = true,
    },
    keys = {
        { "<leader>fy", "<cmd>lua require('telescope').extensions.yank_history.yank_history()<CR>", desc = "Yank History" },
    },

}
