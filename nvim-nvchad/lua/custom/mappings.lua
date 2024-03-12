local M = {}

M.disabled = {
	n = {
		["<leader>ra"] = "",
		["<leader>fz"] = "",
	},
}

M.general = {
	i = {},
	n = {
		["n"] = { "nzz", "Next search item" },
		["N"] = { "Nzz", "Previous search item" },
		["<C-u>"] = { "<C-u>zz", "Page up and center" },
		["<C-d>"] = { "<C-d>zz", "Page down and center" },
		["x"] = { '"_x', "Delete without yank" },
		["U"] = { "<C-r>", "Redo action" },
		["<leader>n"] = { ":enew<CR>", "Create new buffer" },
	},
	v = {
		["p"] = { [["_dp]], "Pase over selected text" },

		-- Move selected line / block of text in visual mode
		["K"] = { ":move '<-2<CR>gv=gv", "Move selection up" },
		["J"] = { ":move '>+1<CR>gv=gv", "Move selection down" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		["<leader>fu"] = { "<cmd>Telescope undo<CR>", "Undo history" },
		["gd"] = {
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			"Goto Definition",
		},
		["gi"] = {
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			"Goto Implementations",
		},
		["gr"] = {
			function()
				require("telescope.builtin").lsp_references()
			end,
			"Goto References",
		},
		["gt"] = {
			function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			"Goto Type Definitions",
		},
		["<leader>ds"] = {
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			"Document Symbols",
		},
		["<leader>ws"] = {
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			"Workspace Symbols",
		},
	},
}

M.lspconfig = {
	n = {
		["<leader>rn"] = {
			function()
				require("nvchad.renamer").open()
			end,
			"LSP rename",
		},
	},
}

M.trouble = {
	n = {
		["<leader>D"] = {
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			"Toggle workspace diagnostics",
		},
	},
}

M.refactoring = {
	n = {
		["<leader>rr"] = {
			function()
				require("telescope").load_extension("refactoring")
				require("telescope").extensions.refactoring.refactors()
			end,
			"Refactor with telescope",
		},
	},
}

M.comment = {
	n = {
		["<C-c>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"Toggle comment",
		},
	},
	i = {
		["<C-c>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"Toggle comment",
		},
	},
	v = {
		["<C-c>"] = {
			"<Esc><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"Toggle comment",
		},
	},
}

M.crates = {
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"Upgrade all crates",
		},
	},
}

return M
