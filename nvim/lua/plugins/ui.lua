return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			-- PERF: we don't need this lualine require madness 🤷
			local lualine_require = require("lualine_require")
			lualine_require.require = require

			local opts = {
				options = {
					icons_enabled = true,
					theme = "auto",
					disabled_filetypes = {
						statusline = { "snacks_dashboard" },
					},
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "fileformat" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = " ",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						"filename",
					},
					lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return lazyUtil.ui.fg("Statement") end,
          },
						{
							"diff",
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end,
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "nvim-tree", "lazy" },
			}
			return opts
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				numbers = "none",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local ret = (diag.error and " " .. diag.error .. " " or "")
						.. (diag.warning and " " .. diag.warning or "")
					return vim.trim(ret)
				end,
				-- separator_style = "slant" or "padded_slant",
				show_tab_indicators = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = {
					{
						filetype = "neo-tree",
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
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					require("notify").setup({
						background_colour = "#000000",
						render = "compact",
					})
				end,
			},
		},
		opts = {
			cmdline = {
				view = "cmdline",
			},
			notify = {
				enabled = true,
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
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
				},
			},
		},
		config = function(_, opts)
			require("noice").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			defaults = {},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>G", group = "git" },
					{ "<leader>O", group = "octo" },
					{ "<leader>c", group = "code" },
					{ "<leader>d", group = "document" },
					{ "<leader>f", group = "find" },
					{ "<leader>g", group = "goto" },
					{ "<leader>gs", group = "surround" },
					{ "<leader>h", group = "git Hunk" },
					{ "<leader>r", group = "rename" },
					{ "<leader>s", group = "search" },
					{ "<leader>t", group = "toggle" },
					{ "<leader>v", group = "view" },
					{ "<leader>w", group = "workspace" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			if not vim.tbl_isempty(opts.defaults) then
				vim.notify("which-key: opts.defaults is deprecated. Please use opts.spec instead.", "warn")
				wk.register(opts.defaults)
			end
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
		},
		opts = {
			bufdelete = { enabled = true },
			rename = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					header = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                                                            \/   `==
\   _-'                 RIP AND TEAR, UNTIL IT IS DONE                 `-_   /
  `''                                                                      ``'
]],
					keys = {
						{ action = ":enew", desc = " New File", icon = "", key = "n" },
						{ action = ":Neotree focus", desc = " Open Directory", icon = "", key = "d" },
						{ action = ":Telescope find_files", desc = " Find File", icon = "", key = "f" },
						{
							action = ":Telescope live_grep",
							desc = " Search Project",
							icon = "",
							key = "s",
						},
						{ action = ":e $MYVIMRC", desc = " Configuration", icon = "", key = "c" },
						{ action = ":qa", desc = " Quit NeoVim", icon = "", key = "q" },
					},
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
		},
	},
}
