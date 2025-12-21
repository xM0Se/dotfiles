{pkgs, ...}: {
  vim = {
    keymaps = [
      {
        key = "J";
        mode = "v";
        silent = true;
        action = ":m '>+1<CR>gv=gv";
      }
      {
        key = "K";
        mode = "v";
        silent = true;
        action = ":m '<-2<CR>gv=gv";
      }
      {
        key = "<leader>s";
        mode = "n";
        silent = true;
        action = ''
          function()
              require("flash").treesitter_search()
          end,
        '';
        desc = "Flash continue Search";
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
      lua.enable = true;
    };
  };
}
