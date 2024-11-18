-- globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hide deprecation warnings
vim.g.deprecation_warnings = false
vim.g.autoformat = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

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
opt.breakindent = true --Enable break indent
opt.linebreak = true   -- Wrap lines at convenient points
opt.wrap = false

-- windows
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.winminwidth = 5   -- Minimum window width

-- popups
opt.pumblend = 10  -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
end
