local overrides = require("custom.configs.overrides")

local plugins = {
  {"nvim-tree/nvim-web-devicons",
    opts = overrides.devicons,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    'weilbith/nvim-code-action-menu',
    lazy = false,
    cmd = 'CodeActionMenu',
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require('nvim-ts-autotag').setup()
        end
      },
      {
        'm-demare/hlargs.nvim',
        event = 'InsertEnter',
        config = function ()
          require('hlargs').setup()
        end
      },
      {
        'Wansmer/treesj',
        config = function ()
          require('treesj').setup({
            use_default_keymaps = false,
          })
        end
      },
      {
        'HiPhish/nvim-ts-rainbow2',
        lazy = true,
        module = false,
        config = function()
          local fsize = vim.fn.getfsize(vim.fn.expand('%:p:f'))
          local enable = true
          if vim.fn.line('$') > 3000 or fsize > 100000 then
            lprint(' rainbow disabled', fsize)
            enable = false
            return
          end
          require('nvim-treesitter.configs').setup({
            rainbow = { enable = enable, extended_mode = enable },
          })
        end,
      },
    },
    opts = overrides.treesitter,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    opts = overrides.cmp,
    dependencies = {
      {
        "jcdickinson/codeium.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        config = function()
          require("codeium").setup({})
        end
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
  "lewis6991/gitsigns.nvim",
    opts = overrides.gitsign,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "ojroques/nvim-bufdel",
    event = "BufRead",
    config = function ()
      require('bufdel').setup {
        next = 'tabs',
        quit = false,
      }
    end
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    config = function ()
      require("bufferline").setup{
        options = {
          diagnostics = "nvim_lsp",
          offsets = {{
            filetype = 'neo-tree',
            text = "=͟͟͞͞=͟͟͞͞(●⁰ꈊ⁰● |||)",
            text_align = "center",
            highlight = "PanelHeading",
            padding = 1,
            separator = true,
          }}
        }
      }
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require "custom.configs.neotree"
    end
  },
  {
    'folke/todo-comments.nvim',
    lazy = false,
    config = function()
      require "custom.configs.todo"
    end
  },
  -- 让jj更丝滑~
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    lazy = false,
    config = function ()
      require('colorful-winsep').setup()
    end
  },
  -- 高亮当前选择的代码块(class/function)
  {
    'andymass/vim-matchup',
    lazy = false,
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  -- 滚动条
  {
    'petertriho/nvim-scrollbar',
    lazy = false,
    config = function ()
      require("scrollbar").setup()
    end
  },
  -- 禅模式
  {
    "folke/twilight.nvim",
    lazy = false,
    config = function ()
      require("twilight").setup()
    end
  },
  -- 禅模式(也可调整窗口)
  {
    "Pocco81/TrueZen.nvim",
    lazy = false,
    config = function ()
      require("true-zen").setup {}
    end
  },
  -- 禅模式
  {
    "Pocco81/true-zen.nvim",
    lazy = false,
    config = function ()
      require("true-zen").setup { }
    end
  },
  -- 高亮 lsp 提示颜色
  {
    'folke/lsp-colors.nvim',
    event = "BufRead",
    config = function ()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
      })
    end
  },
  -- 大文件会自动禁用 lsp treesitter
  {
    "LunarVim/bigfile.nvim",
    event = "BufRead",
    config = function ()
      require("bigfile").config {}
    end
  },
  -- 记住上次编辑的位置
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function ()
      require('nvim-lastplace').setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true,
      }
    end
  },
  -- lsp 置灰未使用函数
  {"zbirenbaum/neodim",
    event = {"LspAttach"},
    config = function ()
      require("neodim").setup()
    end
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function ()
      require("nvim-surround").setup()
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    keys = {'f', 'F'},
    -- config = function()
    --   vim.schedule_wrap(require("custom.plugins.custom_plugin_configs.lightspeed"))
    -- end,
  },
  -- 预览当前行号
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = function ()
      require('numb').setup()
    end
  },
  {
    'echasnovski/mini.nvim',
    lazy = false,
    config = function ()
      require('mini.cursorword').setup()
    end
  },
  -- TODO: use barbar.nvim
  {
    "romgrk/barbar.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require'bufferline'.setup {
        animation = false,
        auto_hide = false,
        tabpages = true,
        clickable = true,
        icons = true,
        icon_separator_active = '▎',
        icon_separator_inactive = '▎',
        icon_close_tab = '',
        icon_close_tab_modified = '●',
        icon_pinned = '車',
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
        no_name_title = nil,
      }
    end
  },
  {
    "aserowy/tmux.nvim",
    lazy = false,
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
    "danielfalk/smart-open.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
  },
  {
    "folke/neodev.nvim",
    event = "InsertEnter",
  },
  {
    "gcmt/wildfire.vim",
    event = "InsertEnter",
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
  },
  -- 翻译插件
  {
    'JuanZoran/Trans.nvim',
    build = 'bash ./install.sh',
    event = "InsertEnter",
    dependencies = {
      'kkharji/sqlite.lua',
    },
    config = function ()
      require("Trans").setup {}
      vim.keymap.set({"n", 'x'}, "mm", '<Cmd>Translate<CR>', { desc = ' Translate' })
    end
  },
  -- git diff
  {
    "sindrets/diffview.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins