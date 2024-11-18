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
		opts = function(_, opts)
			opts.window = {
				mappings = {
					["<tab>"] = "toggle_node",
				},
			}
			opts.filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					-- hide_hidden = true,
					never_show = {
						".git",
					},
				},
			}
		end,
	},
}
