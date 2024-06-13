local cmp = require("cmp")

return {
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			scrollbar = false,
			col_offset = -3,
			side_padding = 0,
		},
	},
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "   " .. (strings[2] or "") .. ""

			return kind
		end,
	},
	mapping = {
		["<Esc>"] = cmp.mapping.close(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_legth = 2 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}
