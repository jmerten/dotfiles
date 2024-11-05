return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = LazyVim.root() })
        end,
      },
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Toggle NeoTree",
      },
    },
    opts = {
      window = {
        mappings = {
          ["<tab>"] = "toggle_node",
          ["l"] = "none",
          ["h"] = "none",
        },
      },
    },
  },
}
