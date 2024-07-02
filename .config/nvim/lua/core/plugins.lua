local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim")

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("moll/vim-bbye")
	use("akinsho/toggleterm.nvim")

	use {
        "windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-treesitter.configs').setup {
                autotag = {
                    enable = true,
                }
            }
        end
    }

	use {
        "windwp/nvim-autopairs",
        config = function ()
            require('core.configs.autopairs');
        end
    }

	use {
		"numToStr/Comment.nvim",
        config = function ()
            require('Comment').setup();
        end
	}

	-- use {
 --        "lukas-reineke/indent-blankline.nvim",
 --        config = function ()
 --            require('core.configs.indentline');
 --        end
 --    }

	use {
        "kyazdani42/nvim-tree.lua",
        config = function ()
            require('core.configs.nvimtree');
        end
    }

	use{
        "akinsho/bufferline.nvim",
        config = function ()
            local opts = require('core.configs.bufferline');
            require('bufferline').setup(opts);
        end
    }

	use {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require('core.configs.lualine');
        end
    }



	use("arkav/lualine-lsp-progress")
	use {
		"wfxr/minimap.vim",
		config = function()
			-- vim.g.minimap_width = 12
			-- vim.g.minimap_auto_start = 1
		end,
	}
    --
	-- Colorschemes
	use("overcache/NeoSolarized")
	use("EdenEast/nightfox.nvim")
	use("robertmeta/nofrils")
	use("bluz71/vim-moonfly-colors")
	use("ayu-theme/ayu-vim")
	use("lunarvim/darkplus.nvim") -- cmp plugins
	use("AZanellato/Catppuccino.nvim")
	use("davidosomething/vim-colors-meh")
	use("olivercederborg/poimandres.nvim")
	use("Mofiqul/vscode.nvim")
	use({ "rockyzhang24/arctic.nvim", requires = { "rktjmp/lush.nvim" } })
	use("navarasu/onedark.nvim")
	use("nanotech/jellybeans.vim")
	use({ "nyoom-engineering/oxocarbon.nvim" })
	use({ "Alexis12119/nightly.nvim" })
	use("xiyaowong/nvim-transparent")
	use("ryanoasis/vim-devicons")
    use("AlexvZyl/nordic.nvim")
    use("Abstract-IDE/Abstract-cs")
    use('NLKNguyen/papercolor-theme')
    use { 'talha-akram/noctis.nvim' }
    use {
      "craftzdog/solarized-osaka.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    }
    use {
        'projekt0n/github-nvim-theme',
    }

    -- CMP struffs
	use{
        "hrsh7th/nvim-cmp",
        config = function ()
            require('core.configs.cmp');
        end
    } -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use {
        "neovim/nvim-lspconfig",
        config = function ()
            require('core.configs.lsp');
        end
    } -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("RRethy/vim-illuminate")
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function ()
            local navic = require("nvim-navic")
            require("lspconfig").clangd.setup {
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end
            }
        end
    }
    
    use {
        "folke/trouble.nvim",
         dependencies = { "nvim-tree/nvim-web-devicons" }
    }

    use {
        'utilyre/barbecue.nvim',
        name = 'barbecue',
        event = 'BufReadPre',
        version = '*',
        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            attach_navic = false,
        },
    }

	use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function ()
            require('core.configs.lsp.null-ls');
        end
    }

	use{ 
        "j-hui/fidget.nvim",
        config = function ()
            require('fidget').setup{};
        end
    }
	use{
        "simrat39/symbols-outline.nvim",
        config = function ()
            local opts = require('core.configs.outline');
            require("symbols-outline").setup(opts);
        end
    }

	use({
		"mfussenegger/nvim-jdtls",
		ft = { "Java" },
	})

	--telescope
	use{
        "nvim-telescope/telescope.nvim",
        config = function ()
            require('core.configs.telescope');
        end
    }

	use{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
        config = function ()
            require('core.configs.treesitter');
        end
	}

	use{
        "goolord/alpha-nvim",
        config = function ()
            require('core.configs.alpha');
        end
    }
	use("antoinemadec/FixCursorHold.nvim")

	use{
        "lewis6991/gitsigns.nvim",
        config = function ()
            require('core.configs.gitsigns');
        end
    }

	use {
        "sidebar-nvim/sidebar.nvim",
        config = function ()
            require('sidebar-nvim').setup({
                initial_width = 50,
                sections = { "git", "symbols" },
            });
        end
    }
	use("christoomey/vim-tmux-navigator")

	-- dap stuffs
	use({ "nvim-neotest/nvim-nio" })
	use({ "mfussenegger/nvim-dap" })
	use({ "mxsdev/nvim-dap-vscode-js" })
	use {
        "rcarriga/nvim-dap-ui",
        config = function ()
            require('core.configs.dap.javascript').setup();
            require('core.configs.dap').setup();
        end
    }

    use {"rktjmp/hotpot.nvim"}

	use{
        "stevearc/overseer.nvim",
        config = function ()
            require('core.configs.overseer');
        end
    }
	-- use({
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		require("notify").setup({
	-- 			background_colour = "#141b1e",
	-- 		})
	-- 	end,
	-- })
    use({
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
            window = {
                border = "single",
                margin = { 1, 1, 1, 1 },
                padding = { 1, 2, 1, 2 },
            },
            layout = {
                spacing = 5,
                align = 'center'
            }
        }
      end
    })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
