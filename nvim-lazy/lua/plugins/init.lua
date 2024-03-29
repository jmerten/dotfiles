return {
	-- {
	-- 	"morhetz/gruvbox",
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Add config here or leave blank to use defaults
			})
		end,
	},
	{
		"roobert/surround-ui.nvim",
		dependencies = {
			"kylechui/nvim-surround",
			"folke/which-key.nvim",
		},
		config = function()
			require("surround-ui").setup({
				root_key = "S",
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}
