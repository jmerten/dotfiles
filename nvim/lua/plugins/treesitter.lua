return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		auto_install = true,
		sync_install = false,
		highlight = {
			enable = true,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
			use_languagetree = true,
		},
		indent = { enable = true },

		-- :help nvim-treesitter-textobjects-modules
		-- textobjects = {
		-- 	select = {
		-- 		enable = true,
		-- 		lookahead = true,
		-- 		keymaps = {
		-- 			["aa"] = "@parameter.outer",
		-- 			["ia"] = "@parameter.inner",
		-- 			["af"] = "@function.outer",
		-- 			["if"] = "@function.inner",
		-- 			["ac"] = "@class.outer",
		-- 			["ic"] = "@class.inner",
		-- 		},
		-- 	},
		-- },
		-- matchup = {
		-- 	enable = true,
		-- },
		ensure_installed = {
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"regex",
			"bash",
			"json",
			"markdown",
			"markdown_inline",

			-- development languages
			"go",
			"rust",
			"python",
			-- 'dockerfile',
			-- 'terraform',
			-- 'puppet',
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
