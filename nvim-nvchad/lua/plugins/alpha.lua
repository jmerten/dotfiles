return {
	"goolord/alpha-nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VimEnter",
	enabled = true,
	init = false,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local function header()
			return {
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
			}
		end

		dashboard.section.header.val = header()

		dashboard.section.buttons.val = {
			dashboard.button("n", "  New File", ":enew<CR>"),
			dashboard.button("d", "  Open Directory", ":NvimTreeOpen<CR>"),
			dashboard.button("f", "  Find File", "<cmd> Telescope find_files <CR>"),
			dashboard.button("s", "  Search Project", "<cmd> Telescope live_grep <CR>"),
			dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			-- Number of plugins
			local total_plugins = #require("lazy").plugins()
			local datetime = os.date("%d-%m-%Y  %H:%M:%S")
			local plugins_text = "\t" .. total_plugins .. " plugins  " .. datetime

			-- Quote
			local fortune = require("alpha.fortune")
			local quote = table.concat(fortune(), "\n")

			return plugins_text .. "\n" .. quote
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Constant"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Function"
		dashboard.section.buttons.opts.hl_shortcut = "Type"
		dashboard.opts.opts.noautocmd = true

		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
