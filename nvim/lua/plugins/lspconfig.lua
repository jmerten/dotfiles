local function on_attach(_, bufnr)
	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "LSP Hover" })

	-- helpers
	vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts, { desc = "LSP Toggle signature help" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "LSP Rename" })
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "LSP Code action" })

	-- workspace
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts, { desc = "LSP Add workspace folder" })
	vim.keymap.set(
		"n",
		"<leader>wr",
		vim.lsp.buf.remove_workspace_folder,
		opts,
		{ desc = "LSP Remove workspace folder" }
	)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts, { desc = "LSP List workspace folders" })
end

return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",

	init = function()
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = lazyUtil.icons.diagnostic.error,
					[vim.diagnostic.severity.WARN] = lazyUtil.icons.diagnostic.warn,
					[vim.diagnostic.severity.HINT] = lazyUtil.icons.diagnostic.hint,
					[vim.diagnostic.severity.INFO] = lazyUtil.icons.diagnostic.info,
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		})
	end,

	config = function()
		local lspconfig = require("lspconfig")

		local function on_init(client, _)
			if client.supports_method("textDocument/semanticTokens") then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem = {
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

		local servers = {
			"rust_analyzer",
			"lua_ls",
			-- "marksman",
			-- "dockerls",
			-- "terraformls",
		}

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				on_init = on_init,
				capabilities = capabilities,
			})
		end

		lspconfig.pyright.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
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
		})

		lspconfig.gopls.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
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
					-- gofumpt = true,
				},
			},
		})
	end,
}
