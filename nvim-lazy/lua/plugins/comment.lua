return {
    'echasnovski/mini.comment',
    version = '*',
    dependencies = {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ft", ":TodoTelescope<CR>", desc = "Find TODOs in project" },
        },
        opts = {},
    },
    config = function()
        require("mini.comment").setup({
            hooks = {
                post = function()
                    local r = unpack(vim.api.nvim_win_get_cursor(0))
                    local rcnt = vim.api.nvim_buf_line_count(0)
                    if rcnt > r then
                        vim.api.nvim_win_set_cursor(0, { r + 1, 0 })
                    end
                end
            }
        })
    end,
}
