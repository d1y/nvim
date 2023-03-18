require('custom.options')

local M = {}

-- local transparency = false
-- if vim.fn.has('mac') == 1 then
--   transparency = true
-- end

M.ui = {
  theme = "vscode_dark",
  transparency = false, -- transparency,
}

M.nvimtree = {
  plugin = false,
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
