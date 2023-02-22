local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "volar", "lua_ls", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      require("core.utils").load_mappings("lspconfig", { buffer = bufnr })
      if client.server_capabilities.signatureHelpProvider then
        require("nvchad_ui.signature").setup(client)
      end
      require("nvim-navic").attach(client, bufnr)
    end,
    capabilities = capabilities,
  }
end
