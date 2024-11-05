-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.expandtab = true
opt.autoindent = true

opt.timeoutlen = 300      -- Time in ms to wait for a mapped sequence to complete
opt.termguicolors = true  -- Enable colors in terminal
opt.hlsearch = true       --Set highlight on search
opt.incsearch = true
opt.number = true         --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = ""            --Enable mouse mode
opt.breakindent = true    --Enable break indent
opt.undofile = true       --Save undo history
opt.ignorecase = true     --Case insensitive searching unless /C or capital in search
opt.smartcase = true      -- Smart case
opt.smartindent = true
opt.expandtab = true
opt.updatetime = 250          --Decrease update time
opt.signcolumn = "yes"        -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.wrap = true

opt.splitkeep = "screen"
opt.splitright = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.scrolloff = 8
