local overrides = require "custom.plugins.overrides"

local plugins = {
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
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
  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsign,
  },
  -- 语法增强(高亮括号颜色)
  ['mrjones2014/nvim-ts-rainbow'] = {},
  -- ['kiyoon/treesitter-indent-object.nvim'] = {
  --   disable = true,
  --   before = {"nvim-treesitter", "indent-blankline" },
  --   config = function ()
  --     require("treesitter_indent_object").setup()
  --   end
  -- },
  ["windwp/nvim-ts-autotag"] = {
    before = {"nvim-treesitter"},
    config = function ()
      require('nvim-ts-autotag').setup()
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
        signs = true,
        sign_priority = 9,
        keywords = {
          FIX = {
            icon = ' ',
            color = 'error',
            alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
          },
          TODO = { icon = ' ', color = '#ffbb00' },
          HACK = { icon = ' ', color = 'warning' },
          WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX', 'WARN' } },
          PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
          NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        },
        merge_keywords = true,
        highlight = {
          before = '',
          keyword = 'wide',
          after = 'fg',
          pattern = [[.*<(KEYWORDS)\s*:]],
          comments_only = true,
          max_line_len = 400,
          exclude = {},
        },
        colors = {
          error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
          warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
          info = { 'DiagnosticInfo', '#ffbb00' },
          hint = { 'DiagnosticHint', '#10B981' },
          default = { 'Identifier', '#7C3AED' },
        },
        search = {
          command = 'rg',
          args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
          },
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        },
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
  ["nvim-tree/nvim-web-devicons"] = {
    override_options = overrides.devicons,
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
    after = "ui",
    config = function ()
      local neotree = require("neo-tree")
      neotree.setup {
        window = {
          width = 32,
        },
        popup_border_style = "rounded",
        enable_git_status = true,
        filesystem = {
          follow_current_file = true,
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
  ['echasnovski/mini.nvim'] = {
    config = function ()
      require('mini.cursorword').setup()
    end
  },
  ["Pocco81/true-zen.nvim"] = {
    config = function ()
      require("true-zen").setup { }
    end
  },
  -- TODO: use barbar.nvim
  ["romgrk/barbar.nvim"] = {
    disable = true,
    after = "ui",
    requires = {
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
  ["akinsho/bufferline.nvim"] = {
    disable = false,
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
  -- barbar.nvim not use the plugin
  ["ojroques/nvim-bufdel"] = {
    disable = false,
    config = function ()
      require('bufdel').setup {
        next = 'tabs',
        quit = false,
      }
    end
  },
  ['weilbith/nvim-code-action-menu'] = {
    config = {
      cmd = 'CodeActionMenu',
    }
  },
  ["LudoPinelli/comment-box.nvim"] = { },
  ["TimUntersberger/neogit"] = {
    config = function ()
     require("neogit").setup {}
    end
  },
  ["aserowy/tmux.nvim"] = {
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
  ["ahmedkhalf/project.nvim"] = {
    disable = true,
    requires = {
      "nvim-telescope/telescope.nvim",
    },
    config = function ()
      require("project_nvim").setup {}
    end
  },
  ["danielfalk/smart-open.nvim"] = {
    requires = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
  },
  ["folke/neodev.nvim"] = {},
  ["gcmt/wildfire.vim"] = {},
  -- 高亮treesitter
  ['m-demare/hlargs.nvim'] = {
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function ()
      require('hlargs').setup()
    end
  },
  ['kdheepak/lazygit.nvim'] = {},
  ['JuanZoran/Trans.nvim'] = {
    run = 'bash ./install.sh',
    requires = 'kkharji/sqlite.lua',
    config = function ()
      require("Trans").setup {}
      vim.keymap.set({"n", 'x'}, "mm", '<Cmd>Translate<CR>', { desc = ' Translate' })
    end
  },
  ["tzachar/cmp-tabnine"] = {
     after = "nvim-cmp",
     run = "./install.sh",
     config = function ()
      return {
        max_lines = 1000,
        max_num_results = 5,
        sort = true,
        run_on_every_keystroke = true,
        show_prediction_strength = false
      }
     end
  },
  ["ray-x/cmp-treesitter"] = { after = "nvim-cmp" },
  ["KadoBot/cmp-plugins"] = { after = "nvim-cmp" },
  -- markdown 预览
  ['toppair/peek.nvim'] = {
    run = 'deno task --quiet build:fast',
    config = function ()
      require('peek').setup {}
    end
  },
  ["sindrets/diffview.nvim"] = {
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- 自动缩进成一行(object)
  ["Wansmer/treesj"] = {
    requires = { 'nvim-treesitter' },
    config = function ()
      require('treesj').setup( { use_default_keymaps = false })
      vim.keymap.set('n', '<leader>tm', require( 'treesj').toggle)
    end
  },
  ["Exafunction/codeium.vim"] = { },
  -- 停留缩进位置
  ["gbprod/stay-in-place.nvim"] = {
    config = function ()
      require("stay-in-place").setup({})
    end
  },
  -- 高亮代码
  ["shellRaining/hlchunk.nvim"] = {
    config = function ()
      require('hlchunk').setup({
        indent = {
          enable = false,
        },
        blank = {
          enable = false,
        }
      })
    end
  },
  -- console.log
  ["rareitems/printer.nvim"] = {
    config = function ()
      local function webPrint(_, b)
        return string.format('console.log({%s})', b)
      end
      require('printer').setup({
        keymap = "gp",
         add_to_inside = function(text)
            return ""
         end,
        formatters = {
          typescript = webPrint,
          javascript = webPrint,
          vue = webPrint,
          html = webPrint,
        },
      })
    end
  },
  ["akinsho/git-conflict.nvim"] = {
		config = function()
      local conflict = require("git-conflict")
      conflict.setup({
        default_mappings = false,
        default_commands = true,
        disable_diagnostics = true,
        highlights = {
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "GitConflictDetected",
        callback = function()
          vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
        end,
      })
		end,
	},
}


return plugins
