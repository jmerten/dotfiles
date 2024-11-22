return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = false })
			end,
		},
		{
			"<C-n>",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "Toggle NeoTree",
		},
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		-- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
		-- because `cwd` is not set up properly.
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true,
			callback = function()
				if package.loaded["neo-tree"] then
					return
				else
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == "directory" then
						require("neo-tree")
					end
				end
			end,
		})
	end,
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		window = {
			mappings = {
				["<tab>"] = "toggle_node",
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			diagnostics = {
				symbols = {
					hint = lazyUtil.icons.diagnostic.hint,
					info = lazyUtil.icons.diagnostic.info,
					warn = lazyUtil.icons.diagnostic.warn,
					error = lazyUtil.icons.diagnostic.error,
				},
				highlights = {
					hint = "DiagnosticSignHint",
					info = "DiagnosticSignInfo",
					warn = "DiagnosticSignWarn",
					error = "DiagnosticSignError",
				},
			},
			git_status = {
				symbols = {
					unstaged = "󰄱",
					staged = "󰱒",
				},
			},
		},
	},
	config = function(_, opts)
		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end

		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{ event = events.FILE_MOVED, handler = on_move },
			{ event = events.FILE_RENAMED, handler = on_move },
		})
		require("neo-tree").setup(opts)
		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})
	end,
}
