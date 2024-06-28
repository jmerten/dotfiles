return {
	-- {
	-- 	"morhetz/gruvbox",
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup({
				filetypes = { "lua" },
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		event = "VeryLazy",
		version = "*",
		keys = {
			{
				"<leader>x",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Close current buffer",
			},
			{
				"<leader>X",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Force close current buffer",
			},
		},
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup({
				silent = true,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	{
		"willothy/moveline.nvim",
		build = "make",
		keys = {
			{
				"<C-k>",
				function()
					require("moveline").up()
				end,
				desc = "Move line up",
			},
			{
				"<C-j>",
				function()
					require("moveline").down()
				end,
				desc = "Move line down",
			},
			{
				"<C-k>",
				function()
					require("moveline").block_up()
				end,
				mode = "v",
				desc = "Move block up",
			},
			{
				"<C-j>",
				function()
					require("moveline").block_down()
				end,
				mode = "v",
				desc = "Move block down",
			},
		},
	},
}
