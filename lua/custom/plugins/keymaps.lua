local wk = require("which-key")

P = function(x)
  print(vim.inspect(x))
  return (x)
end

RELOAD = function(...)
  return require 'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

vim.keymap.set("i", "jj", "<ESC>")

-- save in insert mode
vim.keymap.set("i", "<C-s>", "<cmd>:w<cr><esc>")
vim.keymap.set("n", "<C-s>", "<cmd>:w<cr><esc>")

-- Resize window using <shift> arrow keys
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

vim.keymap.set("n", ";", ":")

-- Move between windows using <ctrl> direction
vim.keymap.set("n", '<C-j>', '<C-W>j')
vim.keymap.set("n", '<C-k>', '<C-W>k')
vim.keymap.set("n", '<C-h>', '<C-W>h')
vim.keymap.set("n", '<C-l>', '<C-W>l')

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

local function switchTheme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
    vim.cmd [[Catppuccin mocha]]
  else
    vim.o.background = 'light'
    vim.cmd [[Catppuccin latte]]
  end
end

vmap('>', '>gv')
vmap('<', '<gv')

-- remove search highlight on esc
nmap('<esc>', '<cmd>noh<cr>')

-- find files with telescope
nmap('<c-p>', "<cmd>Telescope find_files<cr>")

-- terminal mode
-- get out ouf terminal insert mode with esc
vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], { silent = true, noremap = true })
--move to other window
vim.keymap.set('t', '<c-j>', [[<c-\><c-n><c-w>w]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>j', [[<c-w>wi]], { silent = true, noremap = true })

-- move between splits and tabs
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')

--show kepbindings with whichkey
--add your own here if you want them to
--show up in the popup as well
wk.register(
  {
    v = {
      name = 'vim',
      t = { switchTheme, 'switch theme' },
      c = { ':Telescope colorscheme<cr>', 'colortheme' },
      l = { ':Lazy<cr>', 'Lazy' },
      m = { ':Mason<cr>', 'Mason' },
    },
    l = {
      name = 'language/lsp',
      r    = { '<cmd>Telescope lsp_references<cr>', 'references' },
      R    = { vim.lsp.buf.rename, 'rename' },
      D    = { vim.lsp.buf.type_definition, 'type definition' },
      a    = { vim.lsp.buf.code_action, 'coda action' },
      e    = { vim.diagnostic.open_float, 'diagnostics' },
      f    = { vim.lsp.buf.format, 'format' },
      o    = { ':SymbolsOutline<cr>', 'outline' },
      d    = {
        name = 'diagnostics',
        d = { vim.diagnostic.disable, 'disable' },
        e = { vim.diagnostic.enable, 'enable' },
      },
      g = { ':Neogen<cr>', 'neogen docstring'}
    },
    f = {
      name = 'find (telescope)',
      f = { '<cmd>Telescope find_files<cr>', 'files' },
      r = { '<cmd>Telescope lsp_references<cr>', 'references' },
      g = { "<cmd>Telescope live_grep<cr>", "grep" },
      c = { "<cmd>Telescope git_commits<cr>", "git commits" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
    },
    g = {
      name = "git",
      c = { ":GitConflictRefresh<cr>", 'conflict' },
      g = { ":Neogit<cr>", "neogit" },
      s = { ":Gitsigns<cr>", "gitsigns" },
      d = {
        name = 'diff',
        o = { ':DiffviewOpen<cr>', 'open' },
        c = { ':DiffviewClose<cr>', 'close' },
      }
    },
  }, { mode = 'n', prefix = '<leader>' }
)

-- normal mode
wk.register({
  ['<c-LeftMouse>'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
  ["<c-q>"]         = { '<cmd>q<cr>', 'close buffer' },
  ['<esc>']         = { '<cmd>noh<cr>', 'remove search highlight' },
  ['<leader>s']         = { '<CMD>:w<CR>', "save current buffer" },
  ['<leader>n']         = { '<CMD>:Neotree toggle<CR>', "neotree toggle" },
  ['<leader>G']         = { '<CMD>:BufferLineCyclePrev<CR>', "bufferline prev" },
  ['<leader>H']         = { '<CMD>:BufferLineCycleNext<CR>', "bufferline next" },
  ["<leader>/"] = {
     function()
      require("Comment.api").toggle.linewise.current()
    end,
    "toggle comment",
  },
  [";"] = { ':' },
  ["\\"] = {
    "<cmd> BufferLinePick <CR>",
    "pick buffer line",
  },
  ['<leader>q'] = {
    "<cmd> BufDel <cr>",
    "del current buffer",
  },
  ['<leader>Q'] = {
    '<cmd> q! <CR>',
    'force quit current buffer',
  },
  ['gd'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
  ["gh"] = {
    '<CMD> lua vim.lsp.buf.hover() <CR>',
    "lsp hover",
  },
  ["K"] = {
    '<CMD> lua vim.lsp.buf.hover() <CR>',
    "lsp hover",
  },
  ["<leader>wa"] = {
    "<cmd> TZAtaraxis <CR>",
    "truzen ataraxis",
  },
  ["<leader>wl"] = {
    "<C-w>v",
    "split window to right",
  },
  ["<leader>wo"] = {
    "<C-w>o",
    "only show current buffer",
  },
  ['<leader>li'] = {
    '<CMD> LspInfo <CR>',
    'show lsp info'
  },
  ['<leader>lr'] = {
    '<CMD> LspRestart <CR>',
    'restart lsp server',
  },
  ["<leader>gg"] = {
    "<cmd> LazyGit <CR>",
    "show lazygit window",
  },
  ["<M-1>"] = {
    vim.diagnostic.goto_prev,
    "goto prev(diagnostic)",
  },
  ["<M-2>"] = {
    vim.diagnostic.goto_next,
    "goto next(diagnostic)",
  },
  ["]c"] = {
    function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    "Jump to next hunk",
    opts = { expr = true },
  },

  ["[c"] = {
    function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    "Jump to prev hunk",
    opts = { expr = true },
  },
  ['<leader>rh'] = {
    function()
      require("gitsigns").reset_hunk()
    end,
    'reset current hunk(git)'
  },
  ["<leader>ph"] = {
    function()
      require("gitsigns").preview_hunk()
    end,
    "Preview hunk(git)",
  },

  ["<leader>gb"] = {
    function()
      package.loaded.gitsigns.blame_line()
    end,
    "Blame line(git)",
  },
  ['8'] = {
    '<CMD>qa!<CR>',
    'force quit nvim',
  }
}, { mode = 'n' })

-- visual mode
wk.register({
  ["<leader>/"] = {
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    "toggle comment",
  },
  ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
  ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  ['.'] = { ':norm .<cr>', 'repat last normal mode command' },
}, { mode = 'v' })

return {}
