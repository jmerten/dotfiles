return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "➤" },
				topdelete = { text = "➤" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>Ghs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>Ghr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>Ghs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Visual stage hunk" })
				map("v", "<leader>Ghr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Visual reset hunk" })
				map("n", "<leader>GhS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>Ghu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>GhR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>Ghp", gs.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>Ghb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame line" })
				map("n", "<leader>Gtb", gs.toggle_current_line_blame, { desc = "Toggle current blame line" })
				map("n", "<leader>Ghd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>GhD", function()
					gs.diffthis("~")
				end, { desc = "Diff this ~" })
				map("n", "<leader>Gtd", gs.toggle_deleted, { desc = "Toggle deleted" })

				-- Text object
				map({ "o", "x" }, "Gih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
			end,
		},
	},
}
