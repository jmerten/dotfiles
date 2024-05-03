function _G.__toggle_contextual(vmode)
	local cfg = require("Comment.config"):get()
	local U = require("Comment.utils")
	local Op = require("Comment.opfunc")
	local range = U.get_region(vmode)
	local same_line = range.srow == range.erow

	local ctx = {
		cmode = U.cmode.toggle,
		range = range,
		cmotion = U.cmotion[vmode] or U.cmotion.line,
		ctype = same_line and U.ctype.linewise or U.ctype.blockwise,
	}

	local lcs, rcs = U.parse_cstr(cfg, ctx)
	local lines = U.get_lines(range)

	local params = {
		range = range,
		lines = lines,
		cfg = cfg,
		cmode = ctx.cmode,
		lcs = lcs,
		rcs = rcs,
	}

	if same_line then
		Op.linewise(params)
	else
		Op.blockwise(params)
	end
end

return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ft", ":TodoTelescope<CR>", desc = "Find TODOs in project" },
		},
		opts = {},
	},
	init = function()
		vim.keymap.set({ "n", "i" }, "<C-c>", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "Toggle comment" })
		vim.keymap.set(
			"x",
			"<C-c>",
			"<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@",
			{ desc = "Toggle comment" }
		)
	end,
	opts = {
		post_hook = function()
			local r = unpack(vim.api.nvim_win_get_cursor(0))
			local rcnt = vim.api.nvim_buf_line_count(0)
			if rcnt > r then
				vim.api.nvim_win_set_cursor(0, { r + 1, 0 })
			end
		end,
	},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
