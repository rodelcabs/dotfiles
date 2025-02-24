return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {'nyoom-engineering/oxocarbon.nvim'},

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesittnvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      config = function()
          require('render-markdown').setup({
              -- The file types to render
              file_types = { 'markdown', 'copilot-chat' }
          })
      end,
      event = "VeryLazy",
  },

  {
    "github/copilot.vim"
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup({
        highlight_headers = false,
        separator = '',
        error_header = '> # Error',
        answer_header = '# Copilot',
        question_header = '# User',
        show_help = false, -- Shows help message as virtual lines when waiting for user input
        show_folds = false, -- Shows folds for sections in chat
        highlight_selection = false, -- Highlight selection
        window = {
          width = 0.3,
          height = 0.5,
        },
      })
      -- remove highlight
      vim.cmd [[
        hi! link CopilotChatError LspDiagnosticsDefaultError
        hi! link CopilotChatWarning LspDiagnosticsDefaultWarning
        hi! link CopilotChatInfo LspDiagnosticsDefaultInformation
        hi! link CopilotChatHint LspDiagnosticsDefaultHint
      ]]
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
            vim.cmd('setlocal nonumber')
        end
      })
    end,
    event = "VeryLazy"
    -- See Commands section for default commands if you want to lazy load on them
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

  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --       return require('configs.settings').noice
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },

  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    config = function()
      require("inc_rename").setup()
    end,
  }
}
