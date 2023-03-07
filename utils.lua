local os = require("os")

local M = {}

local function isMacos()
  local osType = os.getenv("OSTYPE")
  if osType == "darwin" then
    return true
  else
    return false
  end
end

M.isMacos = isMacos

return M
