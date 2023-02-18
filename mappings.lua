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
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
    ["<leader>H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
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
    -- 放大窗口
    ["<leader>i"] = {
      "<cmd> TZFocus <CR>",
      "toggle current buffer(window) maximize"
    },
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
  i = {
    ["jj"] = { "<ESC>", "alias <ESC>" },
  }
}



return M
