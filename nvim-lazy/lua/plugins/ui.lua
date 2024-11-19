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
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	opts = {
	-- 		scope = { show_start = true, show_end = true },
	-- 	},
	-- },
	{
		"folke/noice.nvim",
		-- dependencies = {
		-- 	{
		-- 		"rcarriga/nvim-notify",
		-- 		config = function()
		-- 			require("notify").setup({
		-- 				background_colour = "#000000",
		-- 				render = "compact",
		-- 			})
		-- 		end,
		-- 	},
		-- },
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
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			cmdline = { view = "cmdline" },
			-- notify = { enabled = true },
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
