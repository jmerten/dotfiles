return {
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        opts = {},
        config = function(_, opts)
            require("go").setup(opts)
        end,
        event = "CmdLineEnter",
        ft = { "go", "gomod" },
    },
}
