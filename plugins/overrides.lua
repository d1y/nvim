local M = {}

local buffer_option = {
	-- Complete from all visible buffers (splits)
	get_bufnrs = function()
		local bufs = {}
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			bufs[vim.api.nvim_win_get_buf(win)] = true
		end
		return vim.tbl_keys(bufs)
	end,
}

local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return false
	end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return true
	end
end

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

M.treesitter = {
  ensure_installed = {
    'bash',
    'c',
    'c_sharp',
    'comment',
    'cpp',
    'css',
    'diff',
    'dockerfile',
    'dot',
    'fish',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'go',
    'graphql',
    'html',
    'markdown',
    'pug',
    'prisma',
    'lua',
    'vim',
    'help',
    'java',
    'javascript',
    'typescript',
    'scss',
    'tsx',
    'vue',
    'jsdoc',
    'json',
    'json5',
    'regex',
    'ruby',
    'rust',
    'sql',
    'yaml',
  },
  highlight = {
    disable = { "help" },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

M.alpha = {
  header = {
    val = {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿",
		"⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿",
		"⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿",
		"⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿",
		"⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿",
		"⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
		"⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
		"⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿",
    }
  },
  buttons = {
    type = "group",
    val = {
      button("SPC f f", ">  Find Git File  ", ":Telescope git_files<CR>"),
      button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
      button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
      button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
      button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
      button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
    },
    opts = {
      spacing = 1,
    },
  },
};

M.telescope = {
  defaults = {
    prompt_prefix = " 🥳  ",
    selection_caret = " 👉 ",
    entry_prefix = "  ",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
      },
      width = 0.60,
      height = 0.72,
    }
  },
  extensions_list = { "themes", "terms", "smart_open", "projects" },
}

M.gitsign = {
  current_line_blame = true,
  current_line_blame_formatter = '<author>(<author_time:%Y-%m-%d>) <summary>',
}

M.cmp = {
  sources = {
    { name = "luasnip", priority = 7, max_item_count = 5 },
    { name = "nvim_lsp", priority = 10, },
    { name = "buffer", priority = 7, keyword_length = 5, option = buffer_option, max_item_count = 5 },
    { name = "nvim_lua", priority = 5 },
    { name = "path", priority = 4 },
    -- { name = "cmp_tabnine"},
    { name = "treesitter"},
    { name = "plugins"},
  },
}

M.ui = {
  hl_add = {
    Nvim_navic = {
      fg = "white",
      bg = "statusline_bg",
    },
  },
  statusline = {
    separator_style = "round",
  },
  tabufline = {
    enabled = false,
  },
}

M.term = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.3,
        col = 0.25,
        width = 0.6,
        height = 0.4,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
}

M.devicons = {
  override ={
    default_icon = {
      icon = '🌃',
      name = 'Default',
    },
    c = {
      icon = '',
      name = 'c',
    },
    css = {
      icon = '',
      name = 'css',
    },
    deb = {
      icon = '',
      name = 'deb',
    },
    Dockerfile = {
      icon = '',
      name = 'Dockerfile',
    },
    html = {
      icon = '',
      name = 'html',
    },
    jpeg = {
      icon = '',
      name = 'jpeg',
    },
    jpg = {
      icon = '',
      name = 'jpg',
    },
    js = {
      icon = '',
      name = 'js',
    },
    kt = {
      icon = '󱈙',
      name = 'kt',
    },
    lock = {
      icon = '',
      name = 'lock',
    },
    lua = {
      icon = '',
      name = 'lua',
    },
    mp3 = {
      icon = '',
      name = 'mp3',
    },
    mp4 = {
      icon = '',
      name = 'mp4',
    },
    out = {
      icon = '',
      name = 'out',
    },
    png = {
      icon = '',
      name = 'png',
    },
    py = {
      icon = '',
      name = 'py',
    },
    ['robots.txt'] = {
      icon = 'ﮧ',
      name = 'robots',
    },
    toml = {
      icon = '',
      name = 'toml',
    },
    ts = {
      icon = 'ﯤ',
      name = 'ts',
    },
    ttf = {
      icon = '',
      name = 'TrueTypeFont',
    },
    rb = {
      icon = '',
      name = 'rb',
    },
    rpm = {
      icon = '',
      name = 'rpm',
    },
    vue = {
      icon = '﵂',
      name = 'vue',
    },
    woff = {
      icon = '',
      name = 'WebOpenFontFormat',
    },
    woff2 = {
      icon = '',
      name = 'WebOpenFontFormat2',
    },
    xz = {
      icon = '',
      name = 'xz',
    },
    zip = {
      icon = '',
      name = 'zip',
    },
  } ,
}

return M
