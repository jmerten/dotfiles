local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },

		go = { "goimports", "goimports-reviser", "gofmpt" },
		rust = { "rustfmt" },

		sh = { "shfmt" },
	},

	formatters = {
		goimports_reviser = {
			command = "goimports-reviser",
			args = {
				"-rm-unused",
				"-set-alias",
				"-format",
				-- "-company-prefixes 'some.url'"
			},
			cwd = require("conform.util").root_file({ "go.mod" }),
		},
	},

	-- adding same formatter for multiple filetypes can look too much work for some
	-- instead of the above code you could just use a loop! the config is just a table after all!

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
