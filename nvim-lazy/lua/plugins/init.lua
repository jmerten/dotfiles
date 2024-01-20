return {
    -- {
    --     "morhetz/gruvbox",
    --     config = function()
    --         vim.cmd "colorscheme gruvbox"
    --     end,
    -- },
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.cmd "colorscheme gruvbox-material"
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        config = function()
            require("nvim-web-devicons").setup({
                default = true
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Add config here or leave blank to use defaults
            })
        end,
    },
}
