{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./keymaps.nix
  ];

  vim = {
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

    undoFile = {
      enable = true;
      path = inputs.nvf.lib.nvim.lua.mkLuaInline "os.getenv('XDG_DATA_HOME') .. '/nvim/undo'";
    };

    theme = {
      enable = true;
      name = "rose-pine";
      style = "moon";
    };

    lazy.plugins = {
      ${pkgs.vimPlugins.twilight-nvim.pname} = {
        package = pkgs.vimPlugins.twilight-nvim;
        cmd = ["Twilight"];
      };
      ${pkgs.vimPlugins.zen-mode-nvim.pname} = {
        package = pkgs.vimPlugins.zen-mode-nvim;
        cmd = ["ZenMode"];
        keys = [
          {
            mode = "n";
            key = "<leader>z";
            silent = true;
            action = "function() require('zen-mode').toggle({window = {width = 1 }}) end";
            lua = true;
            desc = "start zen-mode";
          }
        ];
      };
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

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      trouble.enable = true;
      harper-ls.enable = true;
    };

    diagnostics = {
      enable = true;
      config = {
        virtual_lines = true;
      };
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

      yaml = {
        enable = true;
        treesitter.enable = true;
        lsp.enable = true;
      };

      just = {
        enable = true;
        treesitter.enable = true;
        lsp.enable = true;
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
