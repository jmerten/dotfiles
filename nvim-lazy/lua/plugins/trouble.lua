return {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.keymap.set("n", "<leader>D", function() require("trouble").toggle("workspace_diagnostics") end,
            { desc = "Toggle workspace diagnostics" })
    end,
    opts = {},
}
