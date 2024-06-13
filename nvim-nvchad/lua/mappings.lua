require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Center search results
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Better indent
map("v", "<", "<gv", { desc = "Increase indent" })
map("v", ">", ">gv", { desc = "Decrease indent" })

-- Paste over currently selected text without yanking it
map("v", "p", [["_dP]])

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", { desc = "Cancel search highlighting" })

-- Move selected line / block of text in visual mode
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Better line movement
local expr = { expr = true, remap = false }
map("", "k", "(v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk')", expr)
map("", "j", "(v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj')", expr)
map("", "<Up>", "(v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk')", expr)
map("", "<Down>", "(v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj')", expr)
map("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
map("n", "gh", "g0", { desc = "Goto beginning of line" })
map("n", "gl", "g$", { desc = "Goto end of line" })

-- general
map("n", "x", '"_x')
map("n", "U", "<C-r>", { desc = "Redo action" })

-- Buffer management
map("n", "<leader>n", ":enew<CR>", { desc = "Create new buffer" }) -- create new buffer
map("n", "gn", ":bnext<CR>", { desc = "Goto next buffer" }) -- go to next buffer
map("n", "gp", ":bprev<CR>", { desc = "Goto previous buffer" }) -- go to previous buffer

-- Window management
map("n", "<C-w>v", "<C-w>v <C-w>l", { desc = "Split window vertically" })
map("n", "<C-w>s", "<C-w>s <C-w>j", { desc = "Split window horizontally" })

-- LSP
map("n", "]d", function()
	vim.diagnostic.goto_next()
end, { desc = "Goto next diagnostic" })
map("n", "[d", function()
	vim.diagnostic.goto_prev()
end, { desc = "Goto previous diagnostic" })

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>D", builtin.diagnostics, { desc = "Show workspace diagnostics" })
map("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Undo history" })
map("n", "gd", builtin.lsp_definitions, { desc = "Goto Defintion" })
map("n", "gi", builtin.lsp_implementations, { desc = "Goto Implementations" })
map("n", "gr", builtin.lsp_references, { desc = "Goto References" })
map("n", "gt", builtin.lsp_type_definitions, { desc = "Goto Type Definition" })
map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document Symbols" })
map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
map("n", "<leader>fz", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "telescope find in current buffer" })
