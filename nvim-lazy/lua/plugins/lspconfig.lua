return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

		-- LSP Display helpers
		local function lspSymbol(name, icon)
			local hl = "DiagnosticSign" .. name
			vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end

		lspSymbol("Error", "󰅙")
		lspSymbol("Info", "󰋼")
		lspSymbol("Hint", "󰌵")
		lspSymbol("Warn", "")

		vim.diagnostic.config({
			virtual_text = {
				prefix = "",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
		})

		-- Borders for LspInfo winodw
		local win = require("lspconfig.ui.windows")
		local _default_opts = win.default_opts

		win.default_opts = function(options)
			local opts = _default_opts(options)
			opts.border = "single"
			return opts
		end

		-- Global mappings
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end, opts, { desc = "LSP Goto next diagnostic" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end, opts, { desc = "LSP Goto previous diagnostic" })

		vim.diagnostic.config({
			virtual_text = true,
		})

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "LSP Hover" })
				-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "LSP Goto definition" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts, { desc = "LSP Goto declaration" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "LSP Rename" })
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "LSP Code action" })
				vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts, { desc = "LSP Toggle signature help" })
				vim.keymap.set(
					"n",
					"<leader>wa",
					vim.lsp.buf.add_workspace_folder,
					opts,
					{ desc = "LSP Add workspace folder" }
				)
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
			end,
		})

		local lspconfig = require("lspconfig")

		-- if you just want default config for the servers then put them in a table
		local servers = {
			"rust_analyzer",
			"lua_ls",
			-- "marksman",
			-- "dockerls",
			-- "terraformls",
		}

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
			})
		end

		lspconfig.pyright.setup({
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
			on_attach = function(_, bufnr) end,
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
		})
	end,
}
