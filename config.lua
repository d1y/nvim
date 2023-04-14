--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<leader>H"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<leader>G"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["\\"] = ":BufferLinePick<CR>"

lvim.keys.normal_mode["<leader>wl"] = "<C-w>v"
lvim.keys.normal_mode["<leader>wo"] = "<C-w>o"

lvim.builtin.which_key.mappings["q"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["w"] = nil
lvim.builtin.which_key.mappings["c"] = nil
lvim.builtin.which_key.mappings["e"] = nil
lvim.builtin.which_key.mappings["s"] = nil
lvim.keys.normal_mode["<leader>s"] = ":w<cr>"

lvim.keys.normal_mode["<leader>n"] = ":NeoTreeShowToggle<CR>"
lvim.keys.normal_mode["[c"] = ":Gitsigns prev_hunk<CR>"
lvim.keys.normal_mode["]c"] = ":Gitsigns next_hunk<CR>"
lvim.keys.normal_mode["[d"] = ":lua vim.diagnostic.goto_prev()<CR>"
lvim.keys.normal_mode["]d"] = ":lua vim.diagnostic.goto_next()<CR>"

lvim.keys.normal_mode["<leader>rh"] = ":Gitsigns reset_hunk<CR>"

lvim.keys.normal_mode["8"] = ":qa!<CR>"
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.lsp.buffer_mappings.normal_mode['gh'] = lvim.lsp.buffer_mappings.normal_mode['K']

-- -- Change theme settings
lvim.colorscheme = "oxocarbon"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ignore_install = { "haskell", "help" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex", "vue", "typescript" }

lvim.builtin.treesitter.rainbow.enable = true

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)
require("lvim.lsp.manager").setup("volar", {})
require("lvim.lsp.manager").setup("tailwindcss", {})
require("lvim.lsp.manager").setup("tsserver", {})
require("lvim.lsp.manager").setup("emmet_ls", {})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "catppuccin/nvim" },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "vue" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "tpope/vim-surround",
    init = function()
      vim.o.timeoutlen = 500
    end
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require('colorful-winsep').setup()
    end
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jj" },
      }
    end
  },
  {
    'ethanholz/nvim-lastplace'
  },
  { "nacro90/numb.nvim",    event = "BufReadPre", config = true },
  {
    "yamatsum/nvim-cursorline",
    config = function()
      require('nvim-cursorline').setup {
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        }
      }
    end
  },
  { "gcmt/wildfire.vim" },
  {
    "phaazon/hop.nvim",
    config = function()
      local hop = require('hop')
      hop.setup({
        keys = 'etovxqpdygfblzhckisuran'
      })
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end, { remap = true })
    end
    ,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "shellRaining/hlchunk.nvim",
    enable = false,
    config = function()
      require('hlchunk').setup({
        indent = {
          enable = false,
        },
        blank = {
          enable = false,
        }
      })
    end,
  },
  {
    "rareitems/printer.nvim",
    config = function()
      local function webPrint(_, b)
        return string.format('console.log({%s})', b)
      end
      require('printer').setup({
        keymap = "gp",
        add_to_inside = function(_)
          return ""
        end,
        formatters = {
          typescript = webPrint,
          javascript = webPrint,
          vue = webPrint,
          html = webPrint,
        },
      })
    end,
  },
  {
    "Exafunction/codeium.vim",
    config = function()
      -- https://github.com/Exafunction/codeium.vim
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<M-Bslash>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<M-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('n', '<M-c>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim"
  },
  {
    "liuchengxu/space-vim-dark"
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    'nyoom-engineering/oxocarbon.nvim'
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {}
    end
  }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
