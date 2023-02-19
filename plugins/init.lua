local overrides = require "custom.plugins.overrides"

local plugins = {
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },
  ["nvim-tree/nvim-tree.lua"] = {
    disable = true,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  -- 语法增强(高亮括号颜色)
  ['mrjones2014/nvim-ts-rainbow'] = {},
  ['kiyoon/treesitter-indent-object.nvim'] = {
    before = {"nvim-treesitter", "indent-blankline" },
    config = function ()
      require("treesitter_indent_object").setup()
    end
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    after = {
      "nvim-ts-rainbow",
    },
    override_options = overrides.treesitter,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  -- 高亮当前窗口?
  ["nvim-zh/colorful-winsep.nvim"] = {
    config = function ()
      require('colorful-winsep').setup()
    end
  },
  -- 让jj更丝滑~
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = {"jj"},
      }
    end,
  },
  -- 高亮TODO
  ['folke/todo-comments.nvim'] = {
    config = function()
      require("todo-comments").setup {
    }
    end
  },
  -- 高亮当前选择的代码块(class/function)
  ['andymass/vim-matchup'] = {
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  -- 滚动条
  ['petertriho/nvim-scrollbar'] = {
    config = function ()
      require("scrollbar").setup()
    end
  },
  -- 禅模式
  ["folke/twilight.nvim"] = {
    config = function ()
      require("twilight").setup()
    end
  },
  -- 禅模式(也可调整窗口)
  ["Pocco81/TrueZen.nvim"] = {
    config = function ()
      require("true-zen").setup {}
    end
  },
  -- 高亮 lsp 提示颜色
  ['folke/lsp-colors.nvim'] = {
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
  ["LunarVim/bigfile.nvim"] = {
    config = function ()
      require("bigfile").config {}
    end
  },
  -- 记住上次编辑的位置
  ["ethanholz/nvim-lastplace"] = {
    config = function ()
      require('nvim-lastplace').setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true,
      }
    end
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      local neotree = require("neo-tree")
      neotree.setup {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              ".DS_Store",
              "thumbs.db",
              "node_modules",
              ".git",
            },
          }
        }
      }
    end
  },
  -- lsp 置灰未使用函数
  ["zbirenbaum/neodim"] = {
    event = {"LspAttach"},
    config = function ()
      require("neodim").setup()
    end
  },
  ["kylechui/nvim-surround"] = {
    after = "nvim-cmp",
    config = function ()
      require("nvim-surround").setup()
    end,
  },
  ["ggandor/lightspeed.nvim"] = {
    keys = {'f', 's', 'F', 'S'},
    config = function()
      vim.schedule_wrap(require("custom.plugins.custom_plugin_configs.lightspeed"))
    end,
  },
  -- 预览当前行号
  ["nacro90/numb.nvim"] = {
    config = function ()
      require('numb').setup()
    end
  },
  ['echasnovski/mini.nvim'] = { },
  ["Pocco81/true-zen.nvim"] = {
    config = function ()
      require("true-zen").setup { }
    end
  },
  ["akinsho/bufferline.nvim"] = {
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
  }
}


return plugins
