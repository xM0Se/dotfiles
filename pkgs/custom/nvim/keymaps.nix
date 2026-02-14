{...}: {
  vim.keymaps = [
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
    {
      key = "<leader>sv";
      mode = "n";
      silent = true;
      action = "<cmd>vsplit<cr>";
      desc = "creates vertical split";
    }
    {
      key = "<leader>sh";
      mode = "n";
      silent = true;
      action = "<cmd>split<cr>";
      desc = "creates split";
    }
    {
      key = "<leader>q";
      mode = "n";
      silent = true;
      action = "<cmd>close<cr>";
      desc = "close";
    }
    {
      key = "<leader>m";
      mode = "n";
      silent = true;
      action = "<C-w>_<C-w>|";
      desc = "maximize window";
    }
    {
      key = "<leader>=";
      mode = "n";
      silent = true;
      action = "<C-w>=";
      desc = "equalize windows";
    }
    {
      key = "<leader>h";
      mode = "n";
      silent = true;
      action = "<cmd>:vertical resize -5<cr>";
      desc = "resize window -5 verticaly";
    }
    {
      key = "<leader>j";
      mode = "n";
      silent = true;
      action = "<cmd>:resize +5";
      desc = "resize window +5";
    }
    {
      key = "<leader>k";
      mode = "n";
      silent = true;
      action = "<cmd>:resize -5<cr>";
      desc = "resize window -5";
    }
    {
      key = "<leader>l";
      mode = "n";
      silent = true;
      action = "<cmd>:vertical resize +5<cr>";
      desc = "resize window +5 verticaly";
    }
  ];
}
