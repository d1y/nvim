require('custom.options')

local M = {}

M.ui = {
  theme = "vscode_dark",
  transparency = true,
}

M.nvimtree = {
  plugin = false,
}

M.plugins = require("custom.plugins")
M.mappings = require("custom.mappings")

return M