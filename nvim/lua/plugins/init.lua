return {
	"sindrets/diffview.nvim",
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
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
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
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	-- {
	-- 	"willothy/moveline.nvim",
	-- 	-- build = "make",
	-- 	keys = {
	-- 		{
	-- 			"<C-k>",
	-- 			function()
	-- 				require("moveline").up()
	-- 			end,
	-- 			desc = "Move line up",
	-- 		},
	-- 		{
	-- 			"<C-j>",
	-- 			function()
	-- 				require("moveline").down()
	-- 			end,
	-- 			desc = "Move line down",
	-- 		},
	-- 		{
	-- 			"<C-k>",
	-- 			function()
	-- 				require("moveline").block_up()
	-- 			end,
	-- 			mode = "v",
	-- 			desc = "Move block up",
	-- 		},
	-- 		{
	-- 			"<C-j>",
	-- 			function()
	-- 				require("moveline").block_down()
	-- 			end,
	-- 			mode = "v",
	-- 			desc = "Move block down",
	-- 		},
	-- 	},
	-- },
}
