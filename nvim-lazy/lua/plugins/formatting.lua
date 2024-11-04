return {
	{
		"stevearc/conform.nvim",
		dependencies = false,
		keys = false,
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
				lsp_format = "fallback", -- not recommended to change
			},
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
		},
	},
}
