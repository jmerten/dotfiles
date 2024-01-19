return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "y" },
    cmd = "WhichKey",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        window = {
            border = "single",   -- none, single, double, shadow
            position = "bottom", --bottom, top
        },
    },
    config = function(_, conf)
        require("which-key").setup(conf)

        local opts = {
            mode = "n",     -- Normal mode
            prefix = "<leader>",
            buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true,  -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
        }

        local mappings = {
            c = { name = "[C]ode", _ = 'which_key_ignore' },
            d = { name = "[D]ocument", _ = 'which_key_ignore' },
            f = { name = "[F]ind", _ = 'which_key_ignore' },
            g = { name = "[G]it", _ = 'which_key_ignore' },
            h = { name = "Git [H]unk", _ = 'which_key_ignore' },
            p = { name = "[P]roject", _ = 'which_key_ignore' },
            r = { name = "[R]ename", _ = 'which_key_ignore' },
            s = { name = "[S]earch", _ = 'which_key_ignore' },
            t = { name = "[T]oggle", _ = 'which_key_ignore' },
            v = { name = "[V]iew", _ = 'which_key_ignore' },
            w = { name = "[W]orkspace", _ = 'which_key_ignore' },
        }

        require("which-key").register(mappings, opts)
    end,
}
