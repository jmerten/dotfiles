-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "debugloop/telescope-undo.nvim" },
	},
	cmd = "Telescope",
	opts = {
		defaults = {
			vimgrep_arguments = vimgrep_arguments,
			prompt_prefix = "   ",
			selection_caret = "  ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			file_ignore_patterns = { "node_modules" },
			path_display = { "truncate" },
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		},
		pickers = {
			find_files = {
				find_command = {
					"rg",
					"--files",
					"--sort",
					"path",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
			},
		},
		extensions = {
			undo = {
				side_by_side = true,
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.8,
				},
			},
		},
	},
	init = function()
		local builtin = require("telescope.builtin")

		-- See :help telescope.builtin
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search through all files" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "View help tags" })

		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto Defintion" })
		vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Goto Implementations" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto References" })
		vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Goto Type Definition" })
		vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document Symbols" })
		vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })

		-- Telescope Functions
		-- See `:help telescope.builtin`
		vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "Find recently opened files" })
		vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "Find existing buffers" })
		vim.keymap.set("n", "<leader>f/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Undo history" })
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("undo")
	end,
}
