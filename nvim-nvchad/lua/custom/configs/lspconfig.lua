local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	"rust_analyzer",
	-- "jsonls",
	-- "bashls",
	-- "terraformls",
	-- "dockerls",
	-- "docker_compose_language_service"
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--
-- lspconfig.pyright.setup { blabla}
lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		local utils = require("core.utils")
		utils.load_mappings("lspconfig", { buffer = bufnr })

		if client.server_capabilities.signatureHelpProvider then
			require("nvchad.signature").setup(client)
		end

		if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method("textDocument/semanticTokens") then
			client.server_capabilities.semanticTokensProvider = nil
		end

		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "<leader>tf", ":GoTestFunc -v<CR>", opts, { desc = "Test selected function" })
		vim.keymap.set("n", "<leader>tF", ":GoTestFile -v<CR>", opts, { desc = "Test selected function" })
	end,
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
