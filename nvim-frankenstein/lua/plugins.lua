local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
    use {
      "morhetz/gruvbox",
      config = function()
				vim.cmd "colorscheme gruvbox"
				vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
				vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
      end,
    }

		-- Telescope
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.5',
			-- or                            , branch = '0.1.x',
			requires = { {'nvim-lua/plenary.nvim'} }
		}

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,
		}

		-- LSP stuff
		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			requires = {
				-- LSP Support
				{'neovim/nvim-lspconfig'},
				-- Autocompletion
				{'hrsh7th/nvim-cmp'},
				{'hrsh7th/cmp-buffer'},
				{'hrsh7th/cmp-path'},
				{'hrsh7th/cmp-nvim-lsp'},
				{'hrsh7th/cmp-nvim-lua'},
				{'saadparwaiz1/cmp_luasnip'},
				-- Snippets
				{'L3MON4D3/LuaSnip'},
				{'rafamadriz/friendly-snippets'},
				-- Extras
				{
					'windwp/nvim-autopairs',
					opts = {
						fast_wrap = {},
						disable_filetype = {"TelescopePrompt","vim"},
					},
					config = function(_, opts)
						require("nvim-autopairs").setup(opts)

						-- setup cmp for autopairs
						local cmp_autopairs = require "nvim-autopairs.completion.cmp"
						require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
					end,
				},
			}
		}

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

		-- WhichKey
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    }

		-- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

		-- Status line
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		}

		-- Buffer line 
		use {
			'akinsho/bufferline.nvim',
			event = "BufReadPre",
			requires = 'nvim-web-devicons'
		}

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
