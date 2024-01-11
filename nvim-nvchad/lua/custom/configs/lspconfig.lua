local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    gopls = {
      analyses = {
        shadow = true,
        unusedparams = true,
        useany = true,
        unusedvariable = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
