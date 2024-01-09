local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
		c = { name = "[C]ode", _ = 'which_key_ignore'	},
		d = { name = "[D]ocument", _ = 'which_key_ignore'	},
		g = { name = "[G]it", _ = 'which_key_ignore'	},
		h = { name = "Git [H]unk", _ = 'which_key_ignore'	},
		p = { name = "[P]roject", _ = 'which_key_ignore'	},
		r = { name = "[R]ename", _ = 'which_key_ignore'	},
		s = { name = "[S]earch", _ = 'which_key_ignore'	},
		t = { name = "[T]oggle", _ = 'which_key_ignore'	},
		w = { name = "[W]orkspace", _ = 'which_key_ignore'	},
    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
