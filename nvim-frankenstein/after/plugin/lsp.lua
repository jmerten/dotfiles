local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts, { desc = "LSP Hover" })
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts, {desc = "LSP Open Float"})
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts, { desc = "LSP Code Actions"})
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts,{desc = "LSP References"})
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts,{desc = "LSP Rename Symbol"})
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts,{desc = "LSP Signature Help"})
end)

-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = {'gopls', 'rust_analyzer'},
--   handlers = {
--     lsp.default_setup,
--     lua_ls = function()
--       local lua_opts = lsp.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   }
-- })

require('lspconfig').lua_ls.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').rust_analyzer.setup({})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = lsp.cmp_action()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
    ['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
})
