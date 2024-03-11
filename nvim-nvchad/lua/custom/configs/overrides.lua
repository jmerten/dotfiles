local M = {}

M.treesitter = {
	ensure_installed = {
		-- defaults
		"vim",
		"vimdoc",
		"lua",
		"json",
		"bash",
		"markdown",
		"markdown_inline",

		-- development
		"go",
		"rust",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- development
		-- golang
		"goimports-reviser", -- go formatter
		"golines",

		-- rust
		"rust-analyzer",

		-- others
		"taplo", -- toml formatter

		-- low-level
		"shfmt",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	extensions = {
		undo = {
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
		},
	},
}

return M
