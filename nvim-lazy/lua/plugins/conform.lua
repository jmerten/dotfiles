return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            "Format with conform",
        },
    },
    config = function()
        require("conform").setup({
            lsp_fallback = true,
            formatters_by_ft = {
                lua = { "stylua" },
                go = {
                    "goimports",
                    "goimports-reviser",
                    -- "gofumpt"  -- goimports-reviser should handle this, add if needed
                },
                python = { "isort", "black" },
                rust = { "rustfmt" },
                toml = { "taplo" },
                sh = { "shfmt" },
            },
            formatters = {
                goimports_reviser = {
                    command = "goimports-reviser",
                    args = {
                        "-rm-unused",
                        "-set-alias",
                        "-format",
                        -- "-company-prefixes 'some.url'", -- if needed
                    },
                    -- comment out this line to install conform, then uncomment once installed
                    cwd = require("conform.util").root_file({ "go.mod" }),
                },
            },
            format_on_save = {
                -- These options will be  passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}
