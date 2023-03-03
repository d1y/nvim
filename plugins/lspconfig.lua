local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- vuels
local servers = { "html", "cssls", "tsserver", "volar", "lua_ls", "tailwindcss", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      require("core.utils").load_mappings("lspconfig", { buffer = bufnr })
      if client.server_capabilities.signatureHelpProvider then
        require("nvchad_ui.signature").setup(client)
      end
    end,
    capabilities = capabilities,
  }
end

local function autoInjectLspHelper()
  local flag, neodev = pcall(require, "neodev")
  local msg = string.format('load neodev is %s', tostring(flag))
  neodev.setup({})
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  })
end

autoInjectLspHelper()

