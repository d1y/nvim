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
      function ()
        local _, builtin = pcall(require, "telescope.builtin")
        local _, themes = pcall(require, "telescope.themes")
        local ok = pcall(builtin.git_files, themes.get_dropdown({
          preview = false,
        }))
        if not ok then
          builtin.find_files(themes.get_dropdown())
        end
      end,
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
      ":BufDel <CR>",
      "close buffer",
    },
    ["<leader>Q"] = {
      ":q! <CR>",
      "close buffer(:q)",
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
    ["<leader>lc"] = {
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
    ["\\"] = {
      "<cmd> BufferLinePick <CR>",
      "pick buffer line",
    },
    ['<leader>li'] = {
      '<CMD> LspInfo <CR>',
      'show lsp info'
    },
    ['<leader>lr'] = {
      '<CMD> LspRestart <CR>',
      'restart lsp server',
    },
    ["<leader>lD"] = {
      function ()
        local match_str =  "Delete all unused imports"
        vim.lsp.buf.code_action({
          apply = true,
          filter = function(val)
            if val.title == match_str then
              return true
            end
            return false
          end,
        })
      end,
      "remove all unused import(lsp function)"
    }
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

M.tmux_diy = {
  n = {}
}

-- map 1 - 5 go to tmux window
local tmux_mappings = { 1,2,3,4,5 }
for _, value in ipairs(tmux_mappings) do
  local cmd = string.format('tmux select-window -t %d > /dev/null 2>&1 &', value)
  local key = tostring(value)
  local desc = string.format("go to tmux window %d", value)
  M.tmux_diy.n[key] = {
    function ()
      os.execute(cmd)
    end,
    desc,
  }
end

-- new tmux window
M.tmux_diy.n['0'] = {
  function ()
    os.execute('tmux new-window')
  end,
  'new tmux window',
}

M.window_resize = {
  n = {
  ['<S-UP>'] = { ':resize +2<CR>', 'up resize'},
  ['<S-Down>']= { ':resize -2<CR>', 'down resize'},
  ['<S-Left>']= { ':vertical resize -2<CR>', 'left resize'},
  ['<S-Right>']= { ':vertical resize +2<CR>', 'right resize'},
  }
}

return M
