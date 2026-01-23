{pkgs, ...}: {
  vim = {
    keymaps = [
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

    viAlias = true;
    vimAlias = true;

    options = {
      shiftwidth = 4;
      softtabstop = 4;
      expandtab = true;
      smartindent = true;

      hlsearch = false;
      incsearch = true;

      timeout = true;
      timeoutlen = 100;

      mouse = "";
    };

    undoFile.enable = true;
    # undoFile.path = "../../../.vim/undodir";

    theme = {
      enable = true;
      name = "rose-pine";
      style = "moon";
    };

    extraPlugins = {
      tmux-navigator = {
        package = pkgs.vimPlugins.vim-tmux-navigator;
      };
      smear-cursor = {
        package = pkgs.vimPlugins.smear-cursor-nvim;
        setup = ''require('smear_cursor').setup {}'';
      };
    };

    telescope.enable = true;

    mini = {
      pairs.enable = true;
      indentscope.enable = true;
    };

    utility = {
      yanky-nvim = {
        enable = true;
        setupOpts.ring.storage = "sqlite";
      };
      undotree.enable = true;
      motion.flash-nvim = {
        enable = true;
        mappings.jump = "s";
      };
    };

    luaConfigPost = ''
      vim.g.undotree_WindowLayout = 3
    '';

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    git = {
      enable = true;
    };

    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
    };

    autocomplete.blink-cmp.enable = true;
    statusline.lualine = {
      enable = true;
    };

    debugger.nvim-dap.enable = true;

    languages = {
      enableTreesitter = true;

      nix = {
        enable = true;
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = ["nixd"];
        };
        extraDiagnostics = {
          enable = true;
          types = ["statix" "deadnix"];
        };
        format = {
          enable = true;
          type = ["alejandra"];
        };
      };

      clang = {
        enable = true;
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = ["clangd"];
        };
      };

      bash = {
        enable = true;
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = ["bash-ls"];
        };
        extraDiagnostics = {
          enable = true;
          types = ["shellcheck"];
        };
        format = {
          enable = true;
          type = ["shfmt"];
        };
      };
      lua.enable = true;
    };
  };
}
