return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    }
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "User FilePost",
  --   config = function()
  --     require("ibl").setup({
  --       enabled = false
  --     })
  --   end,
  -- },

  {
    "kyazdani42/nvim-tree.lua",
    opts = function ()
      local config = require("nvchad.configs.nvimtree")
      local customConfig = require('configs.settings').nvimtree

      for k,v in pairs(customConfig) do config[k] = v end

      return config
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function ()
      local config = require("nvchad.configs.telescope")
      local customConfig = require('configs.settings').telescope

      for k,v in pairs(customConfig) do config[k] = v end

      return config
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
        return require('configs.settings').noice
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    config = function()
      require("inc_rename").setup()
    end,
  }
}
