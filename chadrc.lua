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

return M
