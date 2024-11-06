return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts_extend = { "spec" },
	opts = {
		defaults = {},
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>G", group = "git" },
				{ "<leader>O", group = "octo" },
				{ "<leader>c", group = "code" },
				{ "<leader>d", group = "document" },
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "goto" },
				{ "<leader>gs", group = "surround" },
				{ "<leader>h", group = "git Hunk" },
				{ "<leader>r", group = "rename" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "toggle" },
				{ "<leader>v", group = "view" },
				{ "<leader>w", group = "workspace" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		if not vim.tbl_isempty(opts.defaults) then
			vim.notify("which-key: opts.defaults is deprecated. Please use opts.spec instead.", "warn")
			wk.register(opts.defaults)
		end
	end,
}
