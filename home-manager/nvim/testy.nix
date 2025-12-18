{pkgs, ...}: {
  vim = {
    # from nvim/lua/config/keymap.lua
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
      # telescope
      # {
      #     key = "<leader>ff";
      #     mode = "n";
      #     silent = true;
      #     action = ``
      #         function()
      #             require("telescope.builtin").find_files()
      #         end,``;
      #     desc = "Telescope find files";
      # }
      # Flash.nvim mappings
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
    ];

    options = {
      shiftwidth = 4;
      softtabstop = 4;
      expandtab = true;
      smartindent = true;

      hlsearch = false;
      incsearch = true;

      #undodir = "os.getenv('HOME') .. '/.vim/undodir'";
      #undofile = true;

      timeout = true;
      timeoutlen = 100;

      mouse = "";
    };

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
      motion.flash-nvim = {
        enable = true;
        mappings.jump = "s";
        # setupOpts = {''
        #     modes = {
        #         search = {
        #             enabled = true,
        #         },
        #         char = {
        #             jump_labels = true,
        #         },
        #     },
        # ''};
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    autocomplete.blink-cmp.enable = true;

    languages = {
      enableTreesitter = true;

      nix = {
        enable = true;
        lsp.enable = true;
        lsp.servers = ["nixd"];
        format.enable = true;
        format.type = ["alejandra"];
      };
      lua.enable = true;
    };
  };
}
