return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = "rafamadriz/friendly-snippets",
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
                require("luasnip").config.set_config(opts)

                local nvimdir = vim.fn.stdpath("config")
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = {
                        nvimdir .. "/snippets",
                    },
                })

                -- vim.api.nvim_create_autocmd("InsertLeave", {
                --     callback = function()
                --         if
                --             require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                --             and not require("luasnip").session.jump_active
                --         then
                --             require("luasnip").unlink_current()
                --         end
                --     end,
                -- })
            end,
        },
    },

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    opts = {
        highlight = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = true,
        },
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',

        -- experimental auto-brackets support
        -- accept = { auto_brackets = { enabled = true } }

        -- experimental signature help support
        trigger = { signature_help = { enabled = true } },
        keymap = {
            accept = '<Enter>',
            select_prev = { '<Up>', '<Tab>' },
            select_next = { '<Down>', '<S-Tab>' },

            show_documentation = '<C-h>',
            scroll_documentation_up = '<C-u>',
            scroll_documentation_down = '<C-d>',
        },
    }
}
