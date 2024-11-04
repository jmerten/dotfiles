return {
	{
		"nvim-treesitter/nvim-treesitter",
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
			ensure_installed = {
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"regex",
				"bash",
				"json",
				"jsonc",
				"markdown",
				"markdown_inline",
				"regex",
				"toml",
				"yaml",

				-- development languages
				"go",
				"rust",
				"python",
				-- 'dockerfile',
				-- 'terraform',
				-- 'puppet',
			},
		},
	},
}
