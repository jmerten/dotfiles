local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "markdown",
    "markdown_inline",
    "json",
    "bash",
    "vim",
    "vimdoc",

    -- development languages
    "go",
    "rust",
    "terraform",
    "dockerfile",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- generic
    "json-lsp",
    "bash-language-server",
    "terraform-ls",
    "dockerfile-language-server",
    "docker-compose-language-server",

    -- go stuff
    "gopls",
    "goimports",
    "goimports-reviser",

    -- rust stuff
    "rust-analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
