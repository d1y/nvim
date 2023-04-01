return {
  { "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true
  },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { "gcmt/wildfire.vim" },
  {"ojroques/nvim-bufdel", lazy = false, config = function ()
    require('bufdel').setup {
      next = 'tabs',
      quit = false,
    }
  end
  },
  {
    "aserowy/tmux.nvim", 
    config = function ()
      require("tmux").setup {
        copy_sync = {
          sync_clipboard = false,
        },
        navigation = {
          enable_default_keybindings = true,
        },
      }
    end
  },
  { 
    "phaazon/hop.nvim",
    config = function ()
      local hop = require('hop')
      hop.setup ({
        keys = 'etovxqpdygfblzhckisuran'
      })
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end, {remap=true})
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end, {remap=true})
    end
  },
  {
    "nvim-zh/colorful-winsep.nvim", config = function ()
      require('colorful-winsep').setup()
    end
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = {"jj"},
      }
    end
  },
  {
    'ethanholz/nvim-lastplace'
  },
}
