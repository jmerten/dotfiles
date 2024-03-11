local opt = vim.opt

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- View hidden files
vim.g.nvim_tree_hide_dotfiles = 0

-- Snippets
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snippets"

-- General
vim.g.maplocalleader = " "

-- Indenting
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.breakindent = true

--  General
opt.relativenumber = true --Make relative number default
opt.mouse = "" --Enable mouse mode
opt.hlsearch = true
opt.incsearch = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.scrolloff = 8
