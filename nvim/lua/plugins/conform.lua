return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format with conform",
		},
	},
	config = function()
		require("conform").setup({
			lsp_fallback = true,
			formatters_by_ft = {
				lua = { "stylua" },
				go = {
					-- "gofumpt",
					"goimports",
					"golines",
				},
				-- python = { "isort", "black" },
				rust = { "rustfmt" },
				toml = { "taplo" },
				-- sh = { "shfmt" },
			},
			formatters = {
				goimports = {
					command = "goimports",
					args = {
						"-local",
						"git.soma", -- if needed
					},
					cwd = require("conform.util").root_file({ "go.mod" }),
				},
				golines = {
					timeout_ms = 500,
					command = "golines",
					args = {
						"--base-formatter=goimports",
						"--shorten-comments",
						"--ignore-generated",
						"-m",
						"150",
					},
					cwd = require("conform.util").root_file({ "go.mod" }),
				},
				rustfmt = {
					timeout_ms = 1000,
					command = "rustfmt",
					args = {
						"--edition=2021",
					},
					cwd = require("conform.util").root_file({ "Cargo.toml" }),
				},
			},
			format_on_save = {
				-- These options will be  passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
