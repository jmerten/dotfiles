---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- helpful rebinds
    ["U"] = { "<C-r>", "Redo action" },
    ["x"] = { '"_x' },

    -- better line movement
    ["<C-u>"] = { "<C-u>zz", "Page up and center" },
    ["<C-d>"] = { "<C-d>zz", "Page down and center" },
    ["gh"] = { "g0", "Goto beginning of line" },
    ["gl"] = { "g$", "Goto end of line" },

    -- buffer management
    ["<leader>b"] = { "<Nop>" },
    ["<leader>n"] = { ":enew<CR>", "Create new buffer" },
    ["<leader>x"] = { ":bd<CR>", "Close current buffer" },
    ["<leader>X"] = { ":bd!<CR>", "Force close current buffer" },
    ["gn"] = { ":bnext<CR>", "Goto next buffer" },
    ["gp"] = { ":bprevious<CR>", "Goto previous buffer" },

    -- unit testing
    ["<leader>tf"] = { ":GoTestFunc<cr>", "Test selected function" },
    -- ["<leader>tf"] = {
    --   function()
    --     require("neotest").run.run()
    --     -- require("neotest").output.open { enter = true }
    --   end,
    --   "Run selected unit test",
    -- },
    -- ["<leader>tF"] = {
    --   function()
    --     require("neotest").run.run(vim.fn.expand "%")
    --     -- require("neotest").output.open { enter = true }
    --   end,
    --   "Run selected unit tests in file",
    -- },
    -- ["<leader>ts"] = {
    --   function()
    --     require("neotest").output_panel.toggle()
    --   end,
    --   "Toggle test summary",
    -- },
    -- ["<leader>tS"] = {
    --   function()
    --     require("neotest").run.stop()
    --   end,
    --   "Stop unit test",
    -- },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["p"] = { [["_dP"]], "paste without yank" },
    ["K"] = { ":move '<-2<CR>gv=gv", "Move selection up" },
    ["J"] = { ":move '>+1<CR>gv=gv", "Move selection down" },
  },
}

-- more keybinds!
M.tabufline = {
  n = {},
}

M.telescope = {
  n = {
    ["<leader>fg"] = {
      function()
        require("telescope.builtin").git_files()
      end,
      "Find Git files",
    },
    ["<leader>fs"] = {
      function()
        require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " }
      end,
      "Project search",
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>rb"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset buffer",
    },
    ["<leader>tb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "Toggle current blame line",
    },
  },
}

return M
