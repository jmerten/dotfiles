-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 8

-- opt.softtabstop = 2
opt.tabstop = 2
opt.shiftround = true -- Round indent
opt.shiftwidth = 2
opt.expandtab = true  -- tabs as spaces
opt.smartindent = true
-- opt.autoindent = true

opt.confirm = true
opt.timeoutlen = 300          -- Time in ms to wait for a mapped sequence to complete
opt.termguicolors = true      -- Enable colors in terminal
opt.hlsearch = true           --Set highlight on search
opt.incsearch = true
opt.inccommand = "nosplit"    -- preview incremental substitute
opt.number = true             --Make line numbers default
opt.relativenumber = true     --Make relative number default
opt.mouse = ""                --Disable mouse mode
opt.ignorecase = true         --Case insensitive searching unless /C or capital in search
opt.smartcase = true          -- Smart case
opt.updatetime = 250          --Decrease update time
opt.signcolumn = "yes"        -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.jumpoptions = "view"
opt.spelllang = { "en" }

-- lines
opt.cursorline = false -- Disable cursorline highlight
opt.breakindent = true -- Enable break indent
opt.linebreak = true   -- Wrap lines at convenient points
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
