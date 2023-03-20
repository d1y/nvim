require('custom.options')

local M = {}

local transparency = false

if vim.fn.has('mac') == 1 then
  transparency = true
end

M.ui = {
  theme = "radium",
  transparency = transparency,
}

M.nvimtree = {
  plugin = false,
}

M.plugins = require("custom.plugins")
M.mappings = require("custom.mappings")

if vim.g.neovide then
  vim.o.guifont = "Liga SFMono Nerd Font:h14"
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_fullscreen = true
  vim.g.neovide_profiler = false
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_cursor_animate_command_line = true
end

return M
