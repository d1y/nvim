local _, mini_move = pcall(require, "mini.move")

local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  t = {
    ["<A-i>"] = "",
  },
  n = {
    ["<leader>n"] = "",
    ["<C-n>"] = "",
    ["<A-i>"] = "",
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<leader>q"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>wl"] = "",
  },
}

M.diy = {
  t = {
    ["<C-t"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
  n = {
    ["<leader>F"] = {
      "<cmd> Telescope git_files <CR>",
      "show git files(telescope)",
    },
    ["<leader>n"] = {
      "<cmd> NeoTreeShowToggle <CR>",
      "tree toggle"
    },
    ["<leader>s"] = { "<cmd> w <CR>", "save file" },
    ["<leader>rs"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>G"] = {
      ":BufferLineCyclePrev<CR>",
      "goto prev buffer",
    },
    ["<leader>H"] = {
      ":BufferLineCycleNext<CR>",
      "goto next buffer",
    },
    ["<leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
    -- 禅模式
    ["9"] = {
      "<cmd> Twilight <CR>",
      "toggle zen editor mode"
    },
    -- 退出
    ["8"] = {
      "<cmd> qa! <CR>",
      "quit neovim"
    },
    ["7"] = {
      "<cmd> Telescope <CR>",
      "open telescope float window"
    },
    -- packer.vim 插件同步
    ["6"] = {
      "<cmd> PackerSync <CR>",
      "packer.vim sync packages",
    },
    -- lsp code action menu
    ["0"] = {
      "<cmd> CodeActionMenu <CR>",
      "show code action menu(lsp extends)",
    },
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
    ["<leader>wl"] = {
      "<C-w>v <CR>",
      "split window to right",
    },
    ["vai"] = {
      function ()
        require'treesitter_indent_object.textobj'.select_indent_outer()
      end,
      "选择一个代码段全部(function / class)",
    },
    ["vii"] = {
      function ()
        require'treesitter_indent_object.textobj'.select_indent_inner()
      end,
      "选择代码段内部(function / class)"
    },
    ["<leader>wo"] = {
      "<C-w>o",
      "only show current buffer",
    },
  },
  x = {
    ["<"] = {
      function ()
        mini_move.move_selection('left')
      end,
      "block move left",
    },
    [">"] = {
      function ()
        mini_move.move_selection('right')
      end,
      "block move right",
    },
    [","] = {
      function ()
        mini_move.move_selection('down')
      end,
      "block move bottom",
    },
    ["."] = {
      function ()
        mini_move.move_selection('up')
      end,
      "block move top",
    },
  },
  i = {
    ["jj"] = { "<ESC>", "alias <ESC>" },
  }
}



return M
