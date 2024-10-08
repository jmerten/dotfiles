return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "y" },
	cmd = "WhichKey",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		win = {
			border = "single", -- none, single, double, shadow
			position = "bottom", --bottom, top
		},
	},
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>G", group = "[G]it", nowait = false, remap = false },
			{ "<leader>G_", hidden = true, nowait = false, remap = false },
			{ "<leader>O", group = "[O]cto", nowait = false, remap = false },
			{ "<leader>O_", hidden = true, nowait = false, remap = false },
			{ "<leader>c", group = "[C]ode", nowait = false, remap = false },
			{ "<leader>c_", hidden = true, nowait = false, remap = false },
			{ "<leader>d", group = "[D]ocument", nowait = false, remap = false },
			{ "<leader>d_", hidden = true, nowait = false, remap = false },
			{ "<leader>f", group = "[F]ind", nowait = false, remap = false },
			{ "<leader>f_", hidden = true, nowait = false, remap = false },
			{ "<leader>g", group = "[g]oto", nowait = false, remap = false },
			{ "<leader>g_", hidden = true, nowait = false, remap = false },
			{ "<leader>h", group = "Git [H]unk", nowait = false, remap = false },
			{ "<leader>h_", hidden = true, nowait = false, remap = false },
			{ "<leader>r", group = "[R]ename", nowait = false, remap = false },
			{ "<leader>r_", hidden = true, nowait = false, remap = false },
			{ "<leader>s", group = "[S]earch", nowait = false, remap = false },
			{ "<leader>s_", hidden = true, nowait = false, remap = false },
			{ "<leader>t", group = "[T]oggle", nowait = false, remap = false },
			{ "<leader>t_", hidden = true, nowait = false, remap = false },
			{ "<leader>v", group = "[V]iew", nowait = false, remap = false },
			{ "<leader>v_", hidden = true, nowait = false, remap = false },
			{ "<leader>w", group = "[W]orkspace", nowait = false, remap = false },
			{ "<leader>w_", hidden = true, nowait = false, remap = false },
		})
	end,
}
