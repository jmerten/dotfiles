return {
	filters = {
		dotfiles = false,
		git_ignored = false,
		exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
		custom = {
			"^.git$",
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
}
