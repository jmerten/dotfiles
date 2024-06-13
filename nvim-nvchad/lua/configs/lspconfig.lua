-- EXAMPLE
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local function on_attach(client, bufnr)
	local conf = require("nvconfig").ui.lsp

	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto definition"))
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))
	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
	vim.keymap.set("n", "<leader>rn", function()
		require("nvchad.lsp.renamer")()
	end, opts("Rename"))
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Goto references"))
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts("Toggle signature help"))
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	-- setup signature popup
	if conf.signature and client.server_capabilities.signatureHelpProvider then
		require("nvchad.lsp.signature").setup(client, bufnr)
	end
end

local lspconfig = require("lspconfig")
local servers = {
	"rust_analyzer",
	"lua_ls",
	-- "marksman",
	-- "dockerls",
	-- "terraformls",
}

-- lsps with default config
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
