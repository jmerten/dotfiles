return {
  "pwntester/octo.nvim",
  event = { { event = "BufReadCmd", pattern = "octo://*" } },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
  },
  opts = {
    enable_builtin = true,
    default_to_projects_v2 = true,
    picker = "telescope",
  }
}
