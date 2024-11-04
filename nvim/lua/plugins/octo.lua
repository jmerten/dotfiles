return {
  "pwntester/octo.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
  },
  config = function()
    require("octo").setup({
      enable_builtin = true,
    })
    vim.cmd([[hi OctoEditable guibg=none]])
  end,
}
