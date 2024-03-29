-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local options = {
	filters = {
		dotfiles = false,
		git_ignored = false,
		exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
		custom = {
			"^.git$",
		},
	},
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	view = {
		adaptive_size = false,
		side = "left",
		width = 30,
		preserve_window_proportions = true,
	},
	git = {
		enable = true,
		ignore = true,
	},
	renderer = {
		root_folder_label = false,
		indent_markers = {
			enable = false,
		},
		icons = {
			git_placement = "signcolumn",
			show = {
				file = true,
				git = true,
			},
		},
	},
}
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = options,
	keys = {
		{ "<leader>e", ":NvimTreeFocus<CR>", desc = "Nvim tree focus" },
		{ "<c-n>", ":NvimTreeToggle<CR>", desc = "Nvim tree toggle" },
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
