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
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Visual stage hunk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Visual reset hunk" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame line" })
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle current blame line" })
				map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "Diff this ~" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
			end,
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>G", ":Neogit<CR>", desc = "Neogit" },
		},
		opts = {
			integrations = {
				diffview = true,
			},
		},
	},
	-- {
	--     "tpope/vim-fugitive",
	--     event = "VeryLazy",
	--     opts = {},
	--     config = function()
	--         vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "status"})
	--
	--         local fugitive = vim.api.nvim_create_augroup("Fugitive", {})
	--
	--         local autocmd = vim.api.nvim_create_autocmd
	--         autocmd("BufWinEnter", {
	--             group = fugitive,
	--             pattern = "*",
	--             callback = function()
	--                 if vim.bo.ft ~= "fugitive" then
	--                     return
	--                 end
	--
	--                 local bufnr = vim.api.nvim_get_current_buf()
	--                 local opts = { buffer = bufnr, remap = false }
	--                 vim.keymap.set("n", "<leader>gp", function()
	--                     vim.cmd.Git('push')
	--                 end, opts) -- need to finish this command
	--             end
	--         })
	--     end,
	-- }
}
