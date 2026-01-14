return {
  {
    "neovim/nvim-lspconfig",
    dependencies = false,
    opts = {
      inlay_hints = {
        enabled = false,
      },
      diagnostics = {
        float = {
          border = "rounded",
          source = "always",
        },
      },
      capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              documentationFormat = { "markdown", "plaintext" },
              snippetSupport = true,
              preselectSupport = true,
              insertReplaceSupport = true,
              labelDetailsSupport = true,
              deprecatedSupport = true,
              commitCharactersSupport = true,
              tagSupport = { valueSet = { 1 } },
              resolveSupport = {
                properties = {
                  "documentation",
                  "detail",
                  "additionalTextEdits",
                },
              },
            }
          }
        }
      },
      servers = {
        rust_analyzer = { mason = false },
        lua_ls = { mason = false },
        -- "marksman",
        -- "dockerls",
        -- "terraformls",
        pyright = {
          mason = false,
          settings = {
            python = {
              checkOnType = false,
              diagnostics = true,
              inlayHints = true,
              smartCompletion = true,
              analysis = {
                autoImportCompletions = true,
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- "openFilesOnly",
              },
            },
          },
        },
        gopls = {
          mason = false,
          settings = {
            gopls = {
              buildFlags = {
                "-tags=integration",
              },
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
              usePlaceholders = true,
              staticcheck = true,
            },
          },
        },
      },
    },
  },
}
