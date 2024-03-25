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
		"taplo", -- toml formatter

		-- low-level
		"shfmt",
	},
}

M.nvimtree = {
	filters = {
		git_ignored = false,
	},
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = "all",
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
