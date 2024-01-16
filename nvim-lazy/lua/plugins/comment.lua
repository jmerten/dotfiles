return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    keys = {
        { "gcc", mode = "n",          desc = "Comment toggle current line" },
        { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
        { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n",          desc = "Comment toggle current block" },
        { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
        { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
        vim.keymap.set("n", "<C-c>", function()
            require("Comment.api").toggle.linewise.current()
        end, { desc = "Toggle comment" })
        vim.keymap.set("v", "<C-c>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            { desc = "Toggle comment" })
    end,
    config = function(_, opts)
        require("Comment").setup(opts)
    end,
}
