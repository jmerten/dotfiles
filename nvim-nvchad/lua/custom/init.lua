-- local autocmd = vim.api.nvim_create_autocmd
--
-- -- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format { bufnr = args.buf }
--   end,
-- })

-- additional vim options
local opt = vim.opt

-- override tabs
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.scrolloff = 8
opt.relativenumber = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

-- vscode format snippets
vim.g.vscode_snippets_path = { "./snippets/go", "./snippets/rust" }
