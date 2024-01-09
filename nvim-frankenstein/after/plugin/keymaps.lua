vim.g.mapleader = " "

local keymap = vim.keymap

-- Better escape using jk in insert and terminal mode
keymap.set("i","jk","<ESC>")
keymap.set("t","jk","<c-\\><C-n>")

-- Center search results
keymap.set("n","n","nzz")
keymap.set("n","N","Nzz")

-- Better indent
keymap.set("v","<","<gv", {desc = "Increase indent"})
keymap.set("v",">",">gv", {desc = "Decrease indent"})

-- Paste over currently selected text without yanking it
keymap.set("v","p",[["_dP]])

-- Cancel search highlighting with ESC
keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", {desc = "Cancel search highlighting"})

-- Move selected line / block of text in visual mode
keymap.set("v", "K", ":move '<-2<CR>gv=gv", {desc = "Move selection up"})
keymap.set("v", "J", ":move '>+1<CR>gv=gv", {desc = "Move selection down"})

-- Better line movement
keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Page up and center"})
keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Page down and center"})
keymap.set("n", "gh", "g0", {desc = "Goto beginning of line"})
keymap.set("n", "gl", "g$", {desc = "Goto end of line"})

-- Telescope Functions
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- general
keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "View project directory"})
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Cancel highlighting"})
keymap.set("n", "x", '"_x')
keymap.set("n", "U", "<C-r>", {desc = "Redo action"})

-- Buffer management
keymap.set("n", "<leader>n", ":enew<CR>", {desc = "Create new buffer"}) -- create new buffer
keymap.set("n", "<leader>x", ":bd<CR>", {desc = "Close current buffer"}) -- close current buffer
keymap.set("n", "<leader>X", ":bd!<CR>", {desc = "Force close current buffer"}) -- force close current buffer
keymap.set("n","gn",":bnext<CR>", {desc = "Goto next buffer"}) -- go to next buffer
keymap.set("n","gp",":bprevious<CR>", {desc = "Goto previous buffer"}) -- go to previous buffer

-- Testing
-- keymap.set("n", "<leader>tg", function ()
--     require('neotest').run.run()
-- end)

-- -- Tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab
