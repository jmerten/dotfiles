local api = vim.api

api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

local keymap = vim.keymap

-- Better escape using jk in insert and terminal mode
keymap.set("i", "jk", "<ESC>")
keymap.set("t", "jk", "<c-\\><C-n>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Better indent
keymap.set("v", "<", "<gv", { desc = "Increase indent" })
keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

-- Move lines
keymap.set("n", "<C-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap.set("n", "<C-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<C-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<C-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Diagnostics
keymap.set("n", "]d", function()
  vim.diagnostic.goto_next()
end, { desc = "LSP Goto next diagnostic" })
keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev()
end, { desc = "LSP Goto previous diagnostic" })

-- General
keymap.set("v", "p", [["_dP]])
keymap.set("n", "x", '"_x')
keymap.set("n", "U", "<C-r>", { desc = "Redo action" })

-- Cancel search highlighting with ESC
keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", { desc = "Cancel search highlighting" })

-- Better line movement
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })

-- Buffer management
keymap.set("n", "<leader>n", ":enew<CR>", { desc = "Create new buffer" }) -- create new buffer
keymap.set("n", "gn", ":bnext<CR>", { desc = "Goto next buffer" })        -- go to next buffer
keymap.set("n", "gp", ":bprev<CR>", { desc = "Goto previous buffer" })    -- go to previous buffer

-- Window management
keymap.set("n", "<C-w>v", "<C-w>v <C-w>l", { desc = "Split window vertically" })
keymap.set("n", "<C-w>s", "<C-w>s <C-w>j", { desc = "Split window horizontally" })
