local cmp = require("cmp")

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
			"onsails/lspkind.nvim",
		},
		opts = {
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					scrollbar = false,
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					winhighlight = "Normal:CmpDoc",
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
				-- ["<C-p>"] = cmp.mapping.select_prev_item(),
				-- ["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Esc>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				-- ["<Tab>"] = cmp.mapping(function()
				-- 	if cmp.visible() then
				-- 		-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
				-- 		cmp.select_next_item()
				-- 	-- cmp.confirm { select = true }
				-- 	else
				--         "<cmd>lua vim.snippet.jump(1)<cr>"
				-- 	end
				-- end, {
				-- 	"i",
				-- 	"s",
				-- }),
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	elseif require("luasnip").jumpable(-1) then
				-- 		vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, {
				-- 	"i",
				-- 	"s",
				-- }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer", keyword_length = 3 },
			}),
		},
	},
	{
		"folke/ts-comments.nvim",
		enabled = false,
	},
}
