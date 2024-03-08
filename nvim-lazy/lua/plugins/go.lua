return {
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            commands = {
                go = "go",
                gomodifytags = "gomodifytags",
                gotests = "~/go/bin/gotests",
                impl = "impl",
                iferr = "iferr",
            },
        },
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        -- event = "CmdLineEnter",
        ft = { "go", "gomod" },
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
}
