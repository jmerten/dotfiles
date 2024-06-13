return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = require("configs.gitsigns"),
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		opts = require("configs.nvimtree"),
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = require("configs.treesitter"),
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
		},
		opts = require("configs.cmp"),
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "debugloop/telescope-undo.nvim" },
		},
		opts = require("configs.telescope"),
	},
	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "y" },
		opts = require("configs.whichkey"),
		config = function(_, conf)
			require("which-key").setup(conf)

			local opts = {
				mode = "n", -- Normal mode
				prefix = "<leader>",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = false, -- use `nowait` when creating keymaps
			}

			local mappings = {
				c = { name = "[C]ode", _ = "which_key_ignore" },
				d = { name = "[D]ocument", _ = "which_key_ignore" },
				f = { name = "[F]ind", _ = "which_key_ignore" },
				g = { name = "[g]oto", _ = "which_key_ignore" },
				G = { name = "[G]it", _ = "which_key_ignore" },
				h = { name = "Git [H]unk", _ = "which_key_ignore" },
				O = { name = "[O]cto", _ = "which_key_ignore" },
				r = { name = "[R]ename", _ = "which_key_ignore" },
				s = { name = "[S]earch", _ = "which_key_ignore" },
				t = { name = "[T]oggle", _ = "which_key_ignore" },
				v = { name = "[V]iew", _ = "which_key_ignore" },
				w = { name = "[W]orkspace", _ = "which_key_ignore" },
			}

			require("which-key").register(mappings, opts)
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup({
				filetypes = { "lua" },
			})
		end,
	},
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	enabled = false,
	-- },
}
