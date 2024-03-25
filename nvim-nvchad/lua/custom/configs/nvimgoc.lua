local options = {
	verticalSplit = false,
}

require("nvim-goc").setup(options)

local testArgs = {
	"-race",
	"-count=1",
}

vim.keymap.set("n", "<leader>gcf", require("nvim-goc").Coverage, { silent = true, desc = "Run coverage for file" })
vim.keymap.set(
	"n",
	"<leader>gcF",
	require("nvim-goc").CoverageFunc,
	{ silent = true, desc = "Run coverage for function" }
)
vim.keymap.set("n", "<leader>gct", require("nvim-goc").ClearCoverage, { silent = true, desc = "Clear coverage" })
