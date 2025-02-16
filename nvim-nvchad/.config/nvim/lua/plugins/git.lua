return {
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>G", ":Neogit<CR>", desc = "Neogit" },
		},
		opts = {
			integrations = {
				diffview = true,
			},
		},
		setup = function(_, opts)
			require("neogit").setup(opts)
		end,
	},
	{
		"pwntester/octo.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
		},
		config = function()
			require("octo").setup({
				enable_builtin = true,
			})
			vim.cmd([[hi OctoEditable guibg=none]])
		end,
	},
}
