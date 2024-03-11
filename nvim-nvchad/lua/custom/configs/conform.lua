local options = {
	lsp_fallback = true,
	formatters_by_ft = {
		lua = { "stylua" },
		go = {
			-- "gofumpt",
			"goimports-reviser",
			"golines",
		},
		rust = { "rustfmt" },
		toml = { "taplo" },
		sh = { "shfmt" },
	},
	formatters = {
		goimports_reviser = {
			command = "goimports-reviser",
			args = {
				"-rm-unused",
				"-set-alias",
				"-format",
				-- "-company-prefixes 'some.url'", -- if needed
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
}
require("conform").setup(options)
