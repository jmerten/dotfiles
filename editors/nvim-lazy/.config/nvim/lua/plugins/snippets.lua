return {
  {
    "garymjr/nvim-snippets",
    opts = {
      friendly_snippets = true,
      search_paths = {
        vim.fn.stdpath("config") .. "/snippets",
      },
    },
    dependencies = { "rafamadriz/friendly-snippets" },
  },
}
