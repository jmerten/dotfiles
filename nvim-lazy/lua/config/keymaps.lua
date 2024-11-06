-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- general
keymap.set("n", "U", "<C-r>", { desc = "Redo action" })

-- Better escape using jk in insert and terminal mode
keymap.set("i", "jk", "<ESC>")
keymap.set("t", "jk", "<c-\\><C-n>")

-- buffers
keymap.del("n", "[b")
keymap.del("n", "]b")
keymap.set("n", "gn", ":bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "gp", ":bprev<CR>", { desc = "Goto previous buffer" })

-- windows
keymap.del("n", "<leader>-")
keymap.del("n", "<leader>|")

-- remove git keymaps
keymap.del("n", "<leader>gg")
keymap.del("n", "<leader>gG")
keymap.del("n", "<leader>gb")
keymap.del("n", "<leader>gB")
keymap.del("n", "<leader>gl")
keymap.del("n", "<leader>gL")
keymap.del("n", "<leader>ge")
keymap.del("n", "<leader>gf")
keymap.del("n", "<leader>gs")
keymap.del("n", "<leader>gc")
