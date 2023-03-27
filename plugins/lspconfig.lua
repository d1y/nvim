local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- vuels
local servers = { "html", "cssls", "tsserver", "volar", "lua_ls", "tailwindcss", "gopls", "pyright", "rust_analyzer", "bashls" }

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
  local _, neodev = pcall(require, "neodev")
  if not _ then
    return
  end
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

