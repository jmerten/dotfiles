return {
	"sainnhe/gruvbox-material",
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},
	{
		"akinsho/bufferline.nvim",
		keys = false,
		opts = {
			options = {
				close_command = nil,
				right_mouse_command = nil,
				always_show_bufferline = true,
				show_tab_indicators = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
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
	},
	{
		"folke/noice.nvim",
		opts = {
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "%d fewer lines" },
							{ find = "%d more lines" },
						},
					},
					opts = { skip = true },
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			cmdline = { view = "cmdline" },
			notify = { enabled = true },
		},
	},
	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				header = {
					[[                                                                                ]],
					[[ =================     ===============     ===============   ========  ======== ]],
					[[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
					[[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
					[[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
					[[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
					[[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
					[[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
					[[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
					[[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
					[[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
					[[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
					[[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
					[[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
					[[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
					[[ ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   || ]],
					[[ ||.=='    _-'                                                     `' |  /==.|| ]],
					[[ =='    _-'                                                            \/   `== ]],
					[[ \   _-'                 RIP AND TEAR, UNTIL IT IS DONE                 `-_   / ]],
					[[  `''                                                                      ``'  ]],
					[[                                                                                ]],
				},
				center = {
					{ action = "enew<CR>", desc = " New File", icon = "", key = "n" },
					{ action = "Neotree focus", desc = " Open Directory", icon = "", key = "d" },
					{ action = "lua LazyVim.pick('find_files')()", desc = " Find File", icon = "", key = "f" },
					{ action = "lua LazyVim.pick('live_grep')()", desc = " Search Project", icon = "", key = "s" },
					{ action = "e $MYVIMRC", desc = " Configuration", icon = "", key = "c" },
					{ action = "qa", desc = " Quit NeoVim", icon = "", key = "q" },
				},
			},
		},
	},
}
