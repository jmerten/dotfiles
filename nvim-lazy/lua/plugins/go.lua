return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function(_, opts)
        require("go").setup(opts)
    end,
    event = "CmdLineEnter",
    ft = {"go","gomod"},
}
