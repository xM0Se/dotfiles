{...}: {
  vim.keymaps = [
    {
      key = "<leader>ca";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      desc = "select lsp suggestions";
    }
    {
      key = "J";
      mode = "v";
      silent = true;
      action = ":m '>+1<CR>gv=gv";
      desc = "";
    }
    {
      key = "K";
      mode = "v";
      silent = true;
      action = ":m '<-2<CR>gv=gv";
      desc = "";
    }
    {
      key = "<leader>u";
      mode = "n";
      silent = true;
      action = "<cmd>UndotreeToggle<cr>";
      desc = "toggle undotree";
    }
    {
      key = "<leader>fy";
      mode = "n";
      silent = true;
      action = "<cmd>lua require('telescope').extensions.yank_history.yank_history()<CR>";
      desc = "Yank History";
    }
  ];
}
