return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "debugloop/telescope-undo.nvim",
    },
    cmd = "Telescope",
    opts = {
        defaults = {
            -- vimgrep_arguments = vimgrep_arguments,
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            file_ignore_patterns = {
                "^.git/",   -- ignore .git directories
                "^vendor/", -- ignore vendor folders
                "^target/", -- ignore rust target directory
            },
            path_display = { "truncate" },
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = true,
            },
            live_grep = {
                glob_pattern = {
                    "!^.git/*",
                    "!^vendor/*",
                    "!^target/*",
                },
                additional_args = {
                    "--hidden",
                    "--no-ignore",
                },
            },
        },
        extensions = {
            undo = {
                side_by_side = true,
            },
        },
    },
    init = function()
        local builtin = require("telescope.builtin")

        -- See :help telescope.builtin
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search through all files" })
        vim.keymap.set("n", "<leader>f/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "Fuzzily search in current buffer" })
        vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "Find recently opened files" })
        vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "Find existing buffers" })
        vim.keymap.set("n", "<leader>u", ":Telescope undo<CR>", { desc = "Undo history" })
        vim.keymap.set("n", "<leader>c", builtin.git_commits, { desc = "Find Git Commits" })

        vim.keymap.set("n", "<leader>D", builtin.diagnostics, { desc = "Show workspace diagnostics" })
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "View help tags" })

        -- vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto Defintion" })
        -- vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Goto Implementations" })
        -- vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto References" })
        -- vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Goto Type Definition" })
        -- vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document Symbols" })
        -- vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("undo")
    end,
}
