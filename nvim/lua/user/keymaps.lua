local api = vim.api

api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Better escape using jk in insert and terminal mode
keymap.set("i", "jk", "<ESC>")
keymap.set("t", "jk", "<c-\\><C-n>")

-- Center search results
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- Better indent
keymap.set("v", "<", "<gv", { desc = "Increase indent" })
keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

-- Paste over currently selected text without yanking it
-- keymap.set("v", "p", [["_dP]])

-- Cancel search highlighting with ESC
keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", { desc = "Cancel search highlighting" })

-- Better line movement
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })

-- general
keymap.set("n", "x", '"_x')
keymap.set("n", "U", "<C-r>", { desc = "Redo action" })

-- Buffer management
keymap.set("n", "<leader>n", ":enew<CR>", { desc = "Create new buffer" }) -- create new buffer
keymap.set("n", "gn", ":bnext<CR>", { desc = "Goto next buffer" })        -- go to next buffer
keymap.set("n", "gp", ":bprev<CR>", { desc = "Goto previous buffer" })    -- go to previous buffer

-- Window management
keymap.set("n", "<C-w>v", "<C-w>v <C-w>l", { desc = "Split window vertically" })
keymap.set("n", "<C-w>s", "<C-w>s <C-w>j", { desc = "Split window horizontally" })
