return {
	"crispgm/nvim-go",
	event = "CmdLineEnter",
	ft = { "go", "gomod" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		{
			"rafaelsq/nvim-goc.lua",
			event = { "CmdlineEnter" },
			ft = { "go" },
			config = function()
				vim.opt.switchbuf = "useopen"
				require("nvim-goc").setup({ verticalSplit = false })

				vim.keymap.set(
					"n",
					"<leader>gcF",
					require("nvim-goc").Coverage,
					{ silent = true, desc = "Run coverage for file" }
				)
				vim.keymap.set(
					"n",
					"<leader>gcf",
					require("nvim-goc").CoverageFunc,
					{ silent = true, desc = "Run coverage for function" }
				)
				vim.keymap.set(
					"n",
					"<leader>gct",
					require("nvim-goc").ClearCoverage,
					{ silent = true, desc = "Clear coverage" }
				)
			end,
		},
	},
	keys = {
		{ "<leader>gtf", ":GoTestFunc<CR>", desc = "[Go] Test selected function" },
		{ "<leader>gtF", ":GoTestFile<CR>", desc = "[Go] Test file" },
	},
	opts = {
		notify = true,
		formatter = "lsp",
		auto_format = false,
		auto_lint = false,
		lint_prompt_style = "vt",
		-- testing
		test_flags = {
			"-cover",
			"-race",
			"-v",
		},
		test_popup_auto_leave = true,
		test_popup_width = 200,
		test_popup_height = 100,
	},
	config = function(_, opts)
		require("go").setup(opts)
	end,
}
