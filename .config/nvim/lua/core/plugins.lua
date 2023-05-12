local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "windwp/nvim-ts-autotag"
  use "lukas-reineke/indent-blankline.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use 'nvim-lualine/lualine.nvim'
  use "akinsho/toggleterm.nvim"
  use 'arkav/lualine-lsp-progress'
  use 'wfxr/minimap.vim'
  -- Colorschemes
  use "overcache/NeoSolarized"
  use "robertmeta/nofrils"
  use 'bluz71/vim-moonfly-colors'
  use 'ayu-theme/ayu-vim'
  use "lunarvim/darkplus.nvim"  -- cmp plugins
  use "AZanellato/Catppuccino.nvim"
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use 'davidosomething/vim-colors-meh'
  use 'olivercederborg/poimandres.nvim'
  use 'Mofiqul/vscode.nvim'
  use {"rockyzhang24/arctic.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'navarasu/onedark.nvim'
  use 'nanotech/jellybeans.vim'
  use {'nyoom-engineering/oxocarbon.nvim'}
  -- use { 'Everblush/nvim', as = 'everblush' }
  use { "Alexis12119/nightly.nvim" }
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "RRethy/vim-illuminate"
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim"
  use "j-hui/fidget.nvim"
  use 'simrat39/symbols-outline.nvim'
  use {
    "mfussenegger/nvim-jdtls",
    ft = { "Java" }
  }

  use "xiyaowong/nvim-transparent"
  use "ryanoasis/vim-devicons"
  --telescope
  use "nvim-telescope/telescope.nvim"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'goolord/alpha-nvim'
  use "antoinemadec/FixCursorHold.nvim"
  -- use "p00f/nvim-ts-rainbow"
  --[[ use "JoosepAlviste/nvim-ts-context-commentstring" ]]
  use "lewis6991/gitsigns.nvim"
  use "ahmedkhalf/project.nvim"
  use "sidebar-nvim/sidebar.nvim"
    
  use 'christoomey/vim-tmux-navigator'

  -- dap stuffs
  use { "mfussenegger/nvim-dap" }
  use { "mxsdev/nvim-dap-vscode-js" }
  use { "rcarriga/nvim-dap-ui" }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
