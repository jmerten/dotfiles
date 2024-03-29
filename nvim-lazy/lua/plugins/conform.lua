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
					"goimports-reviser",
					"golines",
				},
				-- python = { "isort", "black" },
				rust = { "rustfmt" },
				toml = { "taplo" },
				-- sh = { "shfmt" },
			},
			formatters = {
				goimports_reviser = {
					command = "goimports-reviser",
					args = {
						"-rm-unused",
						"-set-alias",
						"-format",
						-- "-company-prefixes",
						-- "test.com", -- if needed
						"$FILENAME",
					},
					stdin = false, -- make sure file is passed as last arg
					cwd = require("conform.util").root_file({ "go.mod" }),
				},
				golines = {
					command = "golines",
					args = {
						"--base-formatter=golines-reviser",
						"--shorten-comments",
						"--ignore-generated",
						"-m",
						"150",
					},
					cwd = require("conform.util").root_file({ "go.mod" }),
				},
				rustfmt = {
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
