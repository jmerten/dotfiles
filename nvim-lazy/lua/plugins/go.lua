return {
	{
		"crispgm/nvim-go",
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			{
				"rafaelsq/nvim-goc.lua",
				event = { "CmdlineEnter" },
				ft = { "go" },
				opts = {
					verticalSplit = false,
				},
				config = function(_, opts)
					require("nvim-goc").setup(opts)

					vim.keymap.set(
						"n",
						"<leader>gcf",
						require("nvim-goc").Coverage,
						{ silent = true, desc = "Run coverage for file" }
					)

					vim.keymap.set(
						"n",
						"<leader>gcF",
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
		opts = {
			notify = true,
			formatter = "goimports-reviser",
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
		keys = {
			{ "<leader>gtf", ":GoTestFile<CR>", desc = "Run all tests in file" },
			{ "<leader>gtF", ":GoTestFunc<CR>", desc = "Run test for function" },
		},
		config = function(_, opts)
			require("go").setup(opts)
		end,
	},
}
