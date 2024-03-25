local options = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

local mappings = {
	c = { name = "[C]ode", _ = "which_key_ignore" },
	d = { name = "[D]ocument", _ = "which_key_ignore" },
	f = { name = "[F]ind", _ = "which_key_ignore" },
	g = {
		name = "[G]olang",
		_ = "which_key_ignore",
		c = "Coverage",
	},
	G = { name = "[G]it", _ = "which_key_ignore" },
	l = { name = "[L]SP", _ = "which_key_ignore" },
	m = { name = "Telescope", _ = "which_key_ignore" },
	p = { name = "[P]ick", _ = "which_key_ignore" },
	r = { name = "[R]ename", _ = "which_key_ignore" },
	t = { name = "[T]heme", _ = "which_key_ignore" },
	w = { name = "[W]orkspace", _ = "which_key_ignore" },
}

require("which-key").register(mappings, options)
