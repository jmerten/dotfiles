return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			numbers = "none",
			diagnostics = "nvim_lsp",
			-- separator_style = "slant" or "padded_slant",
			show_tab_indicators = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
		highlights = {
			buffer_selected = {
				italic = false,
			},
			indicator_selected = {
				fg = { attribute = "fg", highlight = "Function" },
				italic = false,
			},
		},
	},
}
